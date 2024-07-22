defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    time = datetime |> NaiveDateTime.to_time()
    case Time.compare(time, ~T[12:00:00]) do
      :lt -> true
      _ -> false
    end
  end

  def return_date(checkout_datetime) do
    date = checkout_datetime |> NaiveDateTime.to_date()
    if before_noon?(checkout_datetime) do
      date |> Date.add(28)
    else
      date |> Date.add(29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    return_date = actual_return_datetime |> NaiveDateTime.to_date()
    Date.diff(return_date, planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    date =  datetime |> NaiveDateTime.to_date()
    date |> Date.day_of_week() === 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)
    planned_return_date = return_date(checkout_datetime)
    days_late = days_late(planned_return_date, actual_return_datetime)

    if monday?(actual_return_datetime) do
      trunc(rate * days_late * 0.5)
    else
      rate * days_late
    end
  end
end
