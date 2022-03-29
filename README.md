# Phoenix Static

Demo of serving HTML & Markdown files w/assets via a a catch-all route and a
custom plug. The custom plug uses `Plug.Static` to serve assets such as images
etc. The HTML or Markdown is rendered into the layout like any other Phoenix
template.

## Getting Started

Be sure to set `public_path` to the absolute path to the `public` directory in
`config/config.exs`. The `public_only` key is a list of directories nested under
the `public` directory from which `Plug.Static` is allowed to serve static
assets such as images etc.

```
config :my_static,
  public_path: "/the/full/absolute/path/to/public",
  public_only: ~w(markup markdown)
```

That should be all that is required to run the demo, follow the instructions
below.

---

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
