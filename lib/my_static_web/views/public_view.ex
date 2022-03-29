defmodule MyStaticWeb.PublicView do
  use MyStaticWeb, :view

  def maybe_render_content(path) when is_binary(path) do
    markdown = Path.join([path, "index.md"])
    html = Path.join([path, "index.html"])

    cond do
      File.exists?(html) ->
        {:safe, File.read!(html)}

      File.exists?(markdown) ->
        {:safe, File.read!(markdown) |> Earmark.as_html!()}

      true ->
        nil
    end
  end
end
