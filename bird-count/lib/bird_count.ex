defmodule BirdCount do
  def today([]), do: nil
  def today([hd | _]), do: hd

  def increment_day_count([]), do: [1]
  def increment_day_count([hd | tl]), do: [hd + 1 | tl]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([hd | tl]) do
    hd === 0 || has_day_without_birds?(tl)
  end

  def total([]), do: 0
  def total([hd | tl]) do
    hd + total(tl)
  end

  def busy_days([]), do: 0
  def busy_days([hd | tl]) when hd >= 5, do: 1 + busy_days(tl)
  def busy_days([_ | tl]), do: busy_days(tl)
end
