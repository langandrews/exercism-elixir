defmodule Username do
  def sanitize([]), do: []
  def sanitize([first | rest]) do
    case first do
      char when char >= ?a and char <= ?z or char === ?_ -> [char | sanitize(rest)]
      ?ä -> ~c"ae" ++ sanitize(rest)
      ?ö -> ~c"oe" ++ sanitize(rest)
      ?ü -> ~c"ue" ++ sanitize(rest)
      ?ß -> ~c"ss" ++ sanitize(rest)
      _ -> sanitize(rest)
    end
  end
end
