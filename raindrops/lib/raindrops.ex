defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    result = pling("", number)
    |> plang(number)
    |> plong(number)

    if result === "",
      do: "#{number}",
      else: result
  end

  defp pling(acc, n) when rem(n, 3) === 0, do: acc <> "Pling"
  defp pling(acc, _), do: acc

  defp plang(acc, n) when rem(n, 5) === 0, do: acc <> "Plang"
  defp plang(acc, _), do: acc

  defp plong(acc, n) when rem(n, 7) === 0, do: acc <> "Plong"
  defp plong(acc, _), do: acc
end
