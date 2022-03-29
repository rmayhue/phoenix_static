defmodule MyStaticWeb.PublicController do
  use MyStaticWeb, :controller

  action_fallback MyStaticWeb.FallbackController

  def index(conn, %{"slug" => slug}) do
    slug = Enum.join(slug, "/") |> String.downcase()

    with {:ok, path} <- _check_public_path(slug) do
      conn
      |> assign(:base_url, Routes.public_url(conn, :index, [slug]))
      |> assign(:page_title, _get_title(path, slug))
      |> assign(:path, path)
      |> assign(:slug, slug)
      |> render("index.html")
    end
  end

  #
  # Checks that the `slug` directory exists in `public` and if not causes
  # the FallbackController to render a 404 not found.
  #
  def _check_public_path(slug) do
    path = Application.get_env(:my_static, :public_path) |> Path.join(slug)

    if File.exists?(path) do
      {:ok, path}
    else
      {:error, :not_found}
    end
  end

  #
  # Gets the page title using the `title.txt` file if found or generates
  # it from the `slug`
  #
  def _get_title(path, slug) do
    title_file = "#{path}/title.txt"

    if File.exists?(title_file) do
      title_file
      |> File.read!()
      |> String.trim()
    else
      slug
      |> String.split(["-", "_"])
      |> Enum.map(&String.capitalize/1)
      |> Enum.join(" ")
    end
  end
end
