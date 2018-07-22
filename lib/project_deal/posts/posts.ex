defmodule ProjectDeal.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias ProjectDeal.Repo

  alias ProjectDeal.Posts.Thread

  @doc """
  Returns the list of threads.

  ## Examples

      iex> list_threads()
      [%Thread{}, ...]

  """
  def list_threads do
    Repo.all(Thread)
  end

  @doc """
  Gets a single thread.

  Raises `Ecto.NoResultsError` if the Thread does not exist.

  ## Examples

      iex> get_thread!(123)
      %Thread{}

      iex> get_thread!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thread!(id), do: Repo.get!(Thread, id)

  @doc """
  Creates a thread.

  ## Examples

      iex> create_thread(%{field: value})
      {:ok, %Thread{}}

      iex> create_thread(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thread(attrs \\ %{}) do
    %Thread{}
    |> Thread.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a thread.

  ## Examples

      iex> update_thread(thread, %{field: new_value})
      {:ok, %Thread{}}

      iex> update_thread(thread, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thread(%Thread{} = thread, attrs) do
    thread
    |> Thread.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Thread.

  ## Examples

      iex> delete_thread(thread)
      {:ok, %Thread{}}

      iex> delete_thread(thread)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thread(%Thread{} = thread) do
    Repo.delete(thread)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thread changes.

  ## Examples

      iex> change_thread(thread)
      %Ecto.Changeset{source: %Thread{}}

  """
  def change_thread(%Thread{} = thread) do
    Thread.changeset(thread, %{})
  end

  alias ProjectDeal.Posts.Reply

  @doc """
  Returns the list of replies.

  ## Examples

      iex> list_replies()
      [%Reply{}, ...]

  """
  def list_replies do
    Repo.all(Reply)
  end

  @doc """
  Gets a single reply.

  Raises `Ecto.NoResultsError` if the Reply does not exist.

  ## Examples

      iex> get_reply!(123)
      %Reply{}

      iex> get_reply!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reply!(id), do: Repo.get!(Reply, id)

  @doc """
  Creates a reply.

  ## Examples

      iex> create_reply(%{field: value})
      {:ok, %Reply{}}

      iex> create_reply(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reply(attrs \\ %{}) do
    %Reply{}
    |> Reply.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reply.

  ## Examples

      iex> update_reply(reply, %{field: new_value})
      {:ok, %Reply{}}

      iex> update_reply(reply, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reply(%Reply{} = reply, attrs) do
    reply
    |> Reply.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Reply.

  ## Examples

      iex> delete_reply(reply)
      {:ok, %Reply{}}

      iex> delete_reply(reply)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reply(%Reply{} = reply) do
    Repo.delete(reply)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reply changes.

  ## Examples

      iex> change_reply(reply)
      %Ecto.Changeset{source: %Reply{}}

  """
  def change_reply(%Reply{} = reply) do
    Reply.changeset(reply, %{})
  end
end
