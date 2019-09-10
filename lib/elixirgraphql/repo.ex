defmodule Elixirgraphql.Repo do
  use Ecto.Repo,
    otp_app: :elixirgraphql,
    adapter: Ecto.Adapters.Postgres
end
