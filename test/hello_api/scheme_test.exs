defmodule HelloApi.SchemeTest do
  use HelloApi.DataCase

  alias HelloApi.Scheme

  describe "users" do
    alias HelloApi.Scheme.User

    @valid_attrs %{name: "some name", password: "some password", phonenum: "some phonenum", user_id: "some user_id"}
    @update_attrs %{name: "some updated name", password: "some updated password", phonenum: "some updated phonenum", user_id: "some updated user_id"}
    @invalid_attrs %{name: nil, password: nil, phonenum: nil, user_id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scheme.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Scheme.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Scheme.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Scheme.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.phonenum == "some phonenum"
      assert user.user_id == "some user_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheme.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Scheme.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.phonenum == "some updated phonenum"
      assert user.user_id == "some updated user_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheme.update_user(user, @invalid_attrs)
      assert user == Scheme.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Scheme.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Scheme.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Scheme.change_user(user)
    end
  end

  describe "board" do
    alias HelloApi.Scheme.Board

    @valid_attrs %{content: "some content", title: "some title"}
    @update_attrs %{content: "some updated content", title: "some updated title"}
    @invalid_attrs %{content: nil, title: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scheme.create_board()

      board
    end

    test "list_board/0 returns all board" do
      board = board_fixture()
      assert Scheme.list_board() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Scheme.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Scheme.create_board(@valid_attrs)
      assert board.content == "some content"
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheme.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Scheme.update_board(board, @update_attrs)
      assert board.content == "some updated content"
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheme.update_board(board, @invalid_attrs)
      assert board == Scheme.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Scheme.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Scheme.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Scheme.change_board(board)
    end
  end

  describe "reply" do
    alias HelloApi.Scheme.Reply

    @valid_attrs %{comment: "some comment"}
    @update_attrs %{comment: "some updated comment"}
    @invalid_attrs %{comment: nil}

    def reply_fixture(attrs \\ %{}) do
      {:ok, reply} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scheme.create_reply()

      reply
    end

    test "list_reply/0 returns all reply" do
      reply = reply_fixture()
      assert Scheme.list_reply() == [reply]
    end

    test "get_reply!/1 returns the reply with given id" do
      reply = reply_fixture()
      assert Scheme.get_reply!(reply.id) == reply
    end

    test "create_reply/1 with valid data creates a reply" do
      assert {:ok, %Reply{} = reply} = Scheme.create_reply(@valid_attrs)
      assert reply.comment == "some comment"
    end

    test "create_reply/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheme.create_reply(@invalid_attrs)
    end

    test "update_reply/2 with valid data updates the reply" do
      reply = reply_fixture()
      assert {:ok, %Reply{} = reply} = Scheme.update_reply(reply, @update_attrs)
      assert reply.comment == "some updated comment"
    end

    test "update_reply/2 with invalid data returns error changeset" do
      reply = reply_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheme.update_reply(reply, @invalid_attrs)
      assert reply == Scheme.get_reply!(reply.id)
    end

    test "delete_reply/1 deletes the reply" do
      reply = reply_fixture()
      assert {:ok, %Reply{}} = Scheme.delete_reply(reply)
      assert_raise Ecto.NoResultsError, fn -> Scheme.get_reply!(reply.id) end
    end

    test "change_reply/1 returns a reply changeset" do
      reply = reply_fixture()
      assert %Ecto.Changeset{} = Scheme.change_reply(reply)
    end
  end
end
