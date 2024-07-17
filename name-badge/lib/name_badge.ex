defmodule NameBadge do
  def print(id, name, department) do
    id_label =
      if id do
        "[#{id}] - "
      else
        ""
      end
    department_label =
      if department do
        department |> String.upcase()
      else
        "OWNER"
      end

    id_label <> name <> " - " <> department_label
  end
end
