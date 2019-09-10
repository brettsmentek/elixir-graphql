defmodule ElixirgraphqlWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixirgraphql
  use Absinthe.Phoenix.Endpoint

  origin =
    case Mix.env() do
      _ -> false
    end

  socket "/socket", ElixirgraphqlWeb.AbsintheSocket,
    websocket: [check_origin: origin],
    longpoll: true

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug CORSPlug

  plug ElixirgraphqlWeb.Router
end
