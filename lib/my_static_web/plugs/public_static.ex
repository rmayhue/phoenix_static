defmodule MyStaticWeb.Plug.PublicStatic do
  def init(opts), do: opts

  def call(conn, _opts) do
    opts = Plug.Static.init(
      at: "/",
      from: Application.get_env(:my_static, :public_path),
      only: Application.get_env(:my_static, :public_only)
    )

    Plug.Static.call(conn, opts)
  end
end
