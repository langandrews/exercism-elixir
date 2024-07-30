defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: pos_integer
  def score({_x, _y} = point) do
    cond do
      in_circle?(point, 1) -> 10
      in_circle?(point, 5) -> 5
      in_circle?(point, 10) -> 1
      true -> 0
    end
  end

  @spec in_circle?(position, pos_integer) :: boolean
  defp in_circle?({x, y}, radius) do
    :math.sqrt(x**2 + y**2) <= radius
  end
end
