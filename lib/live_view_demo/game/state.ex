defmodule LiveViewDemo.Game.State do
  defstruct stats: %{ health: 0, sanity: 0 }, inventory: [], flags: %{}, current_scene: nil
end
