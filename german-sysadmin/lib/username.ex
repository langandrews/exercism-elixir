defmodule Username do
  def sanitize([]), do: []
  def sanitize([first | rest]) do
    sanitized =
      case first do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        char when char >= ?a and char <= ?z or char === ?_ -> [char]
        _ -> []
      end
    sanitized ++ sanitize(rest)
  end
end
