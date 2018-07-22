defmodule ProjectDealWeb.ThreadView do
  use ProjectDealWeb, :view
  alias ProjectDealWeb.ThreadView
  
  def render("list.json", %{threads: threads}) do
    %{data: render_many(threads, ThreadView, "thread.json")}
  end

  def render("show.json", %{thread: thread}) do
    %{data: render_one(thread, ThreadView, "thread.json")}
  end

  def render("thread.json", %{thread: thread}) do
    %{id: thread.id, 
      title: thread.title, 
      body: thread.body, 
      link: thread.link}
  end
end