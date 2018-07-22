defmodule ProjectDeal.Repo.Migrations.CreateReplies do
  use Ecto.Migration

  def change do
    create table(:replies) do
      add :body, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :thread_id, references(:threads, on_delete: :nothing)

      timestamps()
    end

    create index(:replies, [:user_id])
    create index(:replies, [:thread_id])
  end
end
