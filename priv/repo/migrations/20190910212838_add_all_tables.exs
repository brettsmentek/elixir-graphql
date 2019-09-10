defmodule Elixirgraphql.Repo.Migrations.AddAllTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

      create table(:posts) do
        add :body, :text
        add :user_id, references(:users, on_delete: :nothing)
  
      timestamps()
    end

    create table(:comments) do
      add :body, :text
      add :post_id, references(:posts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create table(:conversations) do
      add :title, :string

      timestamps()
    end

    create table(:conversation_users) do
      add :conversation_id, references(:conversations, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create table(:messages) do
      add :body, :text
      add :conversation_id, references(:conversations, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users, [:email])
    create index(:posts, [:user_id])
    create index(:comments, [:post_id])
    create index(:comments, [:user_id])
    create index(:conversation_users, [:conversation_id])
    create index(:conversation_users, [:user_id])
    create unique_index(:conversation_users, [:conversation_id, :user_id])
    create index(:messages, [:conversation_id])
    create index(:messages, [:user_id])
  end
end
