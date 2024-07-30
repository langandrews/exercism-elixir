defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) !== length(strand2),
   do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2) do
    {:ok, do_hamming_distance(strand1, strand2, 0)}
  end

  defp do_hamming_distance([], [], count), do: count
  defp do_hamming_distance([hd1 | tl1], [hd2 | tl2], count) do
    if hd1 === hd2 do
      do_hamming_distance(tl1, tl2, count)
    else
      do_hamming_distance(tl1, tl2, count + 1)
    end
  end
end
