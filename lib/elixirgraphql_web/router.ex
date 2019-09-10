defmodule ElixirgraphqlWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug ElixirgraphqlWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: ElixirgraphqlWeb.Schema

    forward "/", Absinthe.Plug, schema: ElixirgraphqlWeb.Schema
  end
end
