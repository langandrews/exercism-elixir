defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn candidate ->
      anagram?(String.downcase(base), String.downcase(candidate))
    end)
  end

  defp anagram?(base, base), do: false
  defp anagram?(base, candidate) do
    sort_letters(base) === sort_letters(candidate)
  end

  defp sort_letters(string) do
    string
    |> String.graphemes()
    |> Enum.sort()
  end
end
