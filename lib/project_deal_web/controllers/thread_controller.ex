defmodule ProjectDealWeb.ThreadController do
  use ProjectDealWeb, :controller

  alias ProjectDeal.Posts
  alias ProjectDeal.Posts.Thread

  action_fallback ProjectDealWeb.FallbackController

  def create(conn, %{"thread" => thread_params}) do
    case Posts.create_thread(thread_params) do
    	{:ok, %Thread{} = user} ->
	      conn
	      |> put_status(:created)
	      |> render("show.json", thread: user)
	    {:error, _} -> 
    	  conn
	      |> send_resp(:bad_request, "")
    end
  end

  def get(conn, %{"id" => id}) do
  	thread = Posts.get_thread!(id)
    render(conn, "show.json", thread: thread)
  end

  def update(conn, %{"id" => id, "thread" => thread_params}) do
    thread = Posts.get_thread!(id)
    with {:ok, %Thread{} = thread} <- Posts.update_thread(thread, thread_params) do
      render(conn, "show.json", thread: thread)
    end
  end

  def delete(conn, %{"id" => id}) do
    thread = Posts.get_thread!(id)
    with {:ok, %Thread{}} <- Posts.delete_thread(thread) do
      send_resp(conn, :no_content, "")
    end
  end
end