defmodule LiveViewDemo.Game.Scenes do
  def load() do
    file = "scenes.toml"
    {:ok, content} = Toml.decode_file(file)
    content
  end
end
