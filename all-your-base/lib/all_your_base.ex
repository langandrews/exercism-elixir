defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert([], _, _), do: {:ok, [0]}
  def convert(digits, input_base, output_base) do
    if valid_digits?(digits, input_base) do
      if Enum.reduce(digits, 0, &+/2) === 0 do
        {:ok, [0]}
      else
        num_base10 = to_base10(digits |> Enum.reverse(), input_base, 0, 0)
        {:ok, from_base10(num_base10, output_base, [])}
      end
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp valid_digits?(digits, input_base) do
    Enum.reduce(digits, true, fn digit, acc ->
      acc and digit >= 0 and digit < input_base
    end)
  end

  defp to_base10([], _, acc, _), do: acc |> trunc
  defp to_base10([digit | rest], input_base, acc, index) do
    new_acc = acc + (digit * :math.pow(input_base, index))
    to_base10(rest, input_base, new_acc, index + 1)
  end

  defp from_base10(0, _, acc), do: acc
  defp from_base10(n, output_base, acc) do
    from_base10(div(n, output_base), output_base, [rem(n, output_base) | acc])
  end
end
