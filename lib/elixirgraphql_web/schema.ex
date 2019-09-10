defmodule ElixirgraphqlWeb.Schema do
  use Absinthe.Schema

  alias ElixirgraphqlWeb.Data

  import_types(Absinthe.Type.Custom)
  import_types(ElixirgraphqlWeb.Schema.CommentTypes)
  import_types(ElixirgraphqlWeb.Schema.ConversationTypes)
  import_types(ElixirgraphqlWeb.Schema.MessageTypes)
  import_types(ElixirgraphqlWeb.Schema.PostTypes)
  import_types(ElixirgraphqlWeb.Schema.UserTypes)

  query do
    import_fields(:comment_queries)
    import_fields(:conversation_queries)
    import_fields(:message_queries)
    import_fields(:post_queries)
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:comment_mutations)
    import_fields(:conversation_mutations)
    import_fields(:message_mutations)
    import_fields(:post_mutations)
    import_fields(:user_mutations)
  end

  subscription do
    import_fields(:comment_subscriptions)
    import_fields(:conversation_subscriptions)
    import_fields(:message_subscriptions)
    import_fields(:post_subscriptions)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Data, Data.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

end
