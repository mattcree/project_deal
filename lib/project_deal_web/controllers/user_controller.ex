defmodule ProjectDealWeb.UserController do
  use ProjectDealWeb, :controller

  alias ProjectDeal.Accounts
  alias ProjectDeal.Accounts.User

  action_fallback ProjectDealWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
    	{:ok, %User{} = user} ->
	      conn
	      |> put_status(:created)
	      |> render("show.json", user: user)
	    {:error, _} -> 
    	  conn
	      |> send_resp(:bad_request, "")
    end
  end

  def get(conn, %{"name" => _} = name) do
  	user = Accounts.get_by!(name)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"name" => name, "user" => user_params}) do
    user = Accounts.get_by!(%{"name" => name})
    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"name" => _} = name) do
    user = Accounts.get_by!(name)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
