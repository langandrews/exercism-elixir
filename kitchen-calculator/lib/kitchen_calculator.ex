defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, volume}),
    do: {:milliliter, volume * 240.0}
  def to_milliliter({:fluid_ounce, volume}),
    do: {:milliliter, volume * 30.0}
  def to_milliliter({:teaspoon, volume}),
    do: {:milliliter, volume * 5.0}
  def to_milliliter({:tablespoon, volume}),
    do: {:milliliter, volume * 15.0}
  def to_milliliter({:milliliter, volume}),
    do: {:milliliter, volume}

  def from_milliliter({:milliliter, volume}, unit = :cup),
    do: {unit, volume / 240}
  def from_milliliter({:milliliter, volume}, unit = :fluid_ounce),
    do: {unit, volume / 30}
  def from_milliliter({:milliliter, volume}, unit = :teaspoon),
    do: {unit, volume / 5}
  def from_milliliter({:milliliter, volume}, unit = :tablespoon),
    do: {unit, volume / 15}
  def from_milliliter({:milliliter, volume}, unit = :milliliter),
    do: {unit, volume}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
