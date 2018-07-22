defmodule ProjectDealWeb.UserView do
  use ProjectDealWeb, :view
  alias ProjectDealWeb.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end
end