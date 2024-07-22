defmodule DNA do
  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], result), do: result
  defp do_encode([hd | tl], result), do: do_encode(tl, <<result::bitstring, encode_nucleotide(hd)::4>>)

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, result), do: result
  defp do_decode(<<first::4, rest::bitstring>>, result), do: do_decode(rest, result ++ [decode_nucleotide(first)])
end
