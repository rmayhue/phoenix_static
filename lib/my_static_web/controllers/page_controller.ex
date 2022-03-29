defmodule MyStaticWeb.PageController do
  use MyStaticWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
