defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path_list = String.split(path, ".")
    do_extract_from_path(data, path_list)
  end

  defp do_extract_from_path(nil, _), do: nil
  defp do_extract_from_path(data, []), do: data
  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    path_list = String.split(path, ".")
    get_in(data, path_list)
  end
end
