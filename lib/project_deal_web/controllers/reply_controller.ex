defmodule ProjectDealWeb.ReplyController do
  use ProjectDealWeb, :controller

  alias ProjectDeal.Posts
  alias ProjectDeal.Posts.Thread
  alias ProjectDeal.Posts.Reply

  action_fallback ProjectDealWeb.FallbackController

  def create(conn, %{"reply" => reply_params}) do
    case Posts.create_reply(reply_params) do
    	{:ok, %Reply{} = reply} ->
	      conn
	      |> put_status(:created)
	      |> render("show.json", reply: reply)
	    {:error, _} -> 
    	  conn
	      |> send_resp(:bad_request, "")
    end
  end

#  def list(conn, %{"id" => id}) do
#  	thread = Posts.get_thread!(id)
#    render(conn, "show.json", thread: thread)
#  end

end