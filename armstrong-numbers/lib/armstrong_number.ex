defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    armstrong?(number, Integer.digits(number))
  end

  defp armstrong?(_, digits) when length(digits) === 1, do: true
  defp armstrong?(number, digits) do
    length = length(digits)
    number == Enum.reduce(digits, 0, &(&2 + Integer.pow(&1, length)))
  end
end
