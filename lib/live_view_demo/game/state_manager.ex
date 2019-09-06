defmodule LiveViewDemo.Game.StateManager do
  alias LiveViewDemo.Game.State

  def init(scenes) do
    root = scenes["root"]
    %State{}
    |> set_stat(:health, 30)
    |> set_stat(:sanity, 15)
    |> transition_to_scene(scenes, root)
  end

  def set_stat(state, stat, value) do
    stats = state.stats
      |> Map.put(stat, value)
    %{state | stats: stats }
  end

  def transition_to_scene(state, scenes, name) do
    scene = scenes[name]
    %{state | current_scene: scene}
  end
end
