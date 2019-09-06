defmodule LiveViewDemoWeb.GameLive do
  use Phoenix.LiveView

  def render(assigns) do
    LiveViewDemoWeb.PageView.render("game.html", assigns)
  end

  def mount(_session, socket) do
    scenes = LiveViewDemo.Game.Scenes.load()
    state = LiveViewDemo.Game.StateManager.init(scenes)
    {:ok, assign(socket, state: state, scenes: scenes)}
  end

  def handle_event("choose", name, socket) do
    state = socket.assigns[:state]
    scenes = socket.assigns[:scenes]
    new_state = LiveViewDemo.Game.StateManager.transition_to_scene(state, scenes, name)
    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("start-over", _val, socket) do
    scenes = socket.assigns[:scenes]
    {:noreply, assign(socket, state: LiveViewDemo.Game.StateManager.init(scenes))}
  end
end
