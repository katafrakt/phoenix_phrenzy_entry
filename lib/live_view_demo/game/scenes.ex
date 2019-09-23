defmodule LiveViewDemo.Game.Scenes do
  def load() do
    file = "scenes.yml"
    {:ok, content} = YamlElixir.read_from_file(file)
    content |> IO.inspect
  end
end
