defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operator, _, args} = ast, acc) when operator in [:def, :defp] do
    {ast, [decode(args) | acc]}
  end
  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp decode([{:when, _, rest} | _]), do: decode(rest)
  defp decode([{_, _, nil} | _]), do: ""
  defp decode([{func, _, args} | _]) do
    String.slice(to_string(func), 0, length(args))
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end
end
