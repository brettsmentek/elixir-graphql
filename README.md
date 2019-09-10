# Elixir-GraphQL

This repo is an example of using the [Phoenix](https://phoenixframework.org) framework with the [Absinthe](https://github.com/absinthe-graphql/absinthe) GraphQL toolkit for Elixir. It is largely inspired by this [blog](https://schneider.dev/blog/elixir-phoenix-absinthe-graphql-react-apollo-absurdly-deep-dive/) post by [@schneidmaster](https://github.com/schneidmaster).

## Setup

1. Install Elixir via the means of your choice ([official docs](https://elixir-lang.org/install.html)).

2. Install dependencies with `mix deps.get`

3. Make sure you have a postgres database running

4. Create and migrate the database with `mix ecto.setup`

5. Start Phoenix GraphQL endpoint with `mix phx.server`

Visit [localhost:4000/graphiql](http://localhost:4000/graphiql) for the interactive GraphiQL interface where you can write and test out GraphQL queries.
