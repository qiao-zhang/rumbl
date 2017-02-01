defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository
  """
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Jose",
                  username: "josevalim", passowrd: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce",
                  username: "redrapids", passowrd: "7langs"},
      %Rumbl.User{id: "3", name: "Chris",
                  username: "chrismccord", passowrd: "phx"},
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module),
              fn map ->
                Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
              end
  end
end
