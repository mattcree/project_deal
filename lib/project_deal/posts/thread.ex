defmodule ProjectDeal.Posts.Thread do
  use Ecto.Schema
  import Ecto.Changeset


  schema "threads" do
    field :body, :string
    field :link, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [:title, :body, :link])
    |> validate_required([:title, :body, :link])
  end
end
