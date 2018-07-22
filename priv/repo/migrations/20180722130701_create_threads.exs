defmodule ProjectDeal.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add :title, :string
      add :body, :string
      add :link, :string

      timestamps()
    end

  end
end
