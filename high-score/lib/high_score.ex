defmodule HighScore do
  @initial_score 0

  def new(), do: Map.new()

  def add_player(scores, name, score \\ @initial_score)
  def add_player(scores, name, score), do: Map.put(scores, name, score)

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn prev -> prev + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
