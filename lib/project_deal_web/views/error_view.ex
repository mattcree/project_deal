defmodule ProjectDealWeb.ErrorView do
  use ProjectDealWeb, :view

  def render("400.html", _assigns) do
    "Bad request"
  end

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("400.json", %{errors: errors}) do
     %{errors: Ecto.Changeset.traverse_errors(errors, &translate_error/1)}
  end

  def render("404.json", _assigns) do
    %{errors: "Not found"}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
