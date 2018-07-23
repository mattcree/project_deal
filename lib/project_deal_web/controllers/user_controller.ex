defmodule ProjectDealWeb.UserController do
  use ProjectDealWeb, :controller

  alias ProjectDealWeb.ErrorView
  alias ProjectDeal.Accounts
  alias ProjectDeal.Accounts.User

  action_fallback ProjectDealWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
    	{:ok, %User{} = user} ->
	      conn
	      |> put_status(:created)
	      |> render("show.json", user: user)
	    {:error, errors} -> 
    	  conn
        |> put_status(:bad_request)
	      |> render(ErrorView, "400.json", errors: errors)
    end
  end

  def get(conn, %{"name" => _} = name) do
    case get_user(name) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)
      {:error, nil} -> 
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json")
    end
  end

  defp get_user(%{"name" => _} = name) do
    case Accounts.get_by(name) do
      %User{} = user ->
        {:ok, user}
      nil -> 
        {:error, nil}
    end
  end

  def update(conn, %{"name" => name, "user" => user_params}) do  
    with {:ok, %User{} = user}    <- get_user(%{"name" => name}),
         {:ok, %User{} = updated} <- Accounts.update_user(user, user_params) 
    do
      conn
      |> put_status(:accepted)
      |> render("show.json", user: updated)
    else
      {:error, nil} ->
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json")
    end
  end

  def delete(conn, %{"name" => _} = name) do
    user = Accounts.get_by(name)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
