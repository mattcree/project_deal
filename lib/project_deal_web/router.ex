defmodule ProjectDealWeb.Router do
  use ProjectDealWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProjectDealWeb do
    pipe_through :api # Use the default browser stack

    post    "/user",       UserController, :create
    get     "/user/:name", UserController, :get
    post    "/user/:name", UserController, :update
    delete  "/user/:name", UserController, :delete

    post    "/thread",     ThreadController, :create
    get     "/thread/:id", ThreadController, :get
    post    "/thread/:id", ThreadController, :update
    delete  "/thread/:id", ThreadController, :delete

    post    "/thread/:id/reply", ReplyController, :create
    get     "/thread/:id/reply", ReplyController, :list

  end

end
