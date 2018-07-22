defmodule ProjectDeal.PostsTest do
  use ProjectDeal.DataCase

  alias ProjectDeal.Posts

  describe "threads" do
    alias ProjectDeal.Posts.Thread

    @valid_attrs %{body: "some body", link: "some link", title: "some title"}
    @update_attrs %{body: "some updated body", link: "some updated link", title: "some updated title"}
    @invalid_attrs %{body: nil, link: nil, title: nil}

    def thread_fixture(attrs \\ %{}) do
      {:ok, thread} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_thread()

      thread
    end

    test "list_threads/0 returns all threads" do
      thread = thread_fixture()
      assert Posts.list_threads() == [thread]
    end

    test "get_thread!/1 returns the thread with given id" do
      thread = thread_fixture()
      assert Posts.get_thread!(thread.id) == thread
    end

    test "create_thread/1 with valid data creates a thread" do
      assert {:ok, %Thread{} = thread} = Posts.create_thread(@valid_attrs)
      assert thread.body == "some body"
      assert thread.link == "some link"
      assert thread.title == "some title"
    end

    test "create_thread/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_thread(@invalid_attrs)
    end

    test "update_thread/2 with valid data updates the thread" do
      thread = thread_fixture()
      assert {:ok, thread} = Posts.update_thread(thread, @update_attrs)
      assert %Thread{} = thread
      assert thread.body == "some updated body"
      assert thread.link == "some updated link"
      assert thread.title == "some updated title"
    end

    test "update_thread/2 with invalid data returns error changeset" do
      thread = thread_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_thread(thread, @invalid_attrs)
      assert thread == Posts.get_thread!(thread.id)
    end

    test "delete_thread/1 deletes the thread" do
      thread = thread_fixture()
      assert {:ok, %Thread{}} = Posts.delete_thread(thread)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_thread!(thread.id) end
    end

    test "change_thread/1 returns a thread changeset" do
      thread = thread_fixture()
      assert %Ecto.Changeset{} = Posts.change_thread(thread)
    end
  end

  describe "replies" do
    alias ProjectDeal.Posts.Reply

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def reply_fixture(attrs \\ %{}) do
      {:ok, reply} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_reply()

      reply
    end

    test "list_replies/0 returns all replies" do
      reply = reply_fixture()
      assert Posts.list_replies() == [reply]
    end

    test "get_reply!/1 returns the reply with given id" do
      reply = reply_fixture()
      assert Posts.get_reply!(reply.id) == reply
    end

    test "create_reply/1 with valid data creates a reply" do
      assert {:ok, %Reply{} = reply} = Posts.create_reply(@valid_attrs)
      assert reply.body == "some body"
    end

    test "create_reply/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_reply(@invalid_attrs)
    end

    test "update_reply/2 with valid data updates the reply" do
      reply = reply_fixture()
      assert {:ok, reply} = Posts.update_reply(reply, @update_attrs)
      assert %Reply{} = reply
      assert reply.body == "some updated body"
    end

    test "update_reply/2 with invalid data returns error changeset" do
      reply = reply_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_reply(reply, @invalid_attrs)
      assert reply == Posts.get_reply!(reply.id)
    end

    test "delete_reply/1 deletes the reply" do
      reply = reply_fixture()
      assert {:ok, %Reply{}} = Posts.delete_reply(reply)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_reply!(reply.id) end
    end

    test "change_reply/1 returns a reply changeset" do
      reply = reply_fixture()
      assert %Ecto.Changeset{} = Posts.change_reply(reply)
    end
  end
end
