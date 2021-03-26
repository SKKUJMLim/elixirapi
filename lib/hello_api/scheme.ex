defmodule HelloApi.Scheme do
  @moduledoc """
  The Scheme context.
  """

  import Ecto.Query, warn: false
  alias HelloApi.Repo

  ##########################################################

  alias HelloApi.Scheme.User

  def get_user_by_uid(uid, pwd) do
    Repo.get_by(User, user_id: uid, password: pwd)
  end

  def get_user_byID(id) do
    Repo.get(User, id)
  end

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  #################################################################################

  alias HelloApi.Scheme.Board

  def get_board_list_by_userid(id) do
    query =
      from b in Board,
      left_join: u in User,
      on: b.user_key == u.id,
      where: u.id == ^id,
      select: %{id: b.id, title: b.title, content: b.content, user_key: b.user_key}
    Repo.all(query)
  end

  def list_board do
    Repo.all(Board)
  end

  def get_board!(id), do: Repo.get!(Board, id)

  def create_board(attrs \\ %{}) do
    %Board{}
    |> Board.changeset(attrs)
    |> Repo.insert()
  end

  def update_board(%Board{} = board, attrs) do
    board
    |> Board.changeset(attrs)
    |> Repo.update()
  end

  def delete_board(%Board{} = board) do
    Repo.delete(board)
  end

  def change_board(%Board{} = board, attrs \\ %{}) do
    Board.changeset(board, attrs)
  end

  ##################################################

  alias HelloApi.Scheme.Reply

  def get_reply_list_by_userid(id) do
    query =
      from r in Reply,
      left_join: u in User,
      on: r.user_key == u.id,
      where: u.id == ^id,
      select: %{id: r.id, comment: r.comment, board_key: r.board_key, user_key: r.user_key}
    Repo.all(query)
  end

  def get_replyList_by_boardkey(boardkey) do

    query =
      from r in Reply,
      where: r.board_key == ^boardkey,
      select: %{id: r.id, comment: r.comment, board_key: r.board_key, user_key: r.user_key}
    Repo.all(query)

  end

  def list_reply do
    Repo.all(Reply)
  end

  def get_reply!(id), do: Repo.get!(Reply, id)

  def create_reply(attrs \\ %{}) do
    %Reply{}
    |> Reply.changeset(attrs)
    |> Repo.insert()
  end

  def update_reply(%Reply{} = reply, attrs) do
    reply
    |> Reply.changeset(attrs)
    |> Repo.update()
  end

  def delete_reply(%Reply{} = reply) do
    Repo.delete(reply)
  end

  def change_reply(%Reply{} = reply, attrs \\ %{}) do
    Reply.changeset(reply, attrs)
  end
end
