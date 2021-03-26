defmodule HelloApiWeb.BoardController do
  use HelloApiWeb, :controller

  alias HelloApi.Scheme
  alias HelloApi.Scheme.Board

  def index(conn, _params) do
    board = Scheme.list_board()
    render(conn, "index.html", board: board)
  end

  def new(conn, _params) do
    changeset = Scheme.change_board(%Board{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"board" => board_params}) do

    user_key = get_session(conn, :current_user)
    board_params = Map.put(board_params, "user_key", user_key)
    IO.inspect(board_params)

    case Scheme.create_board(board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board created successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    board = Scheme.get_board!(id)

    replylist = Scheme.get_replyList_by_boardkey(id)
    #replylist = Scheme.list_reply()

    IO.inspect(replylist)

    case replylist do
      nil ->
        render(conn, "show.html", board: board)
      _ ->
        render(conn, "show.html", board: board , reply: replylist)
    end
  end

  def edit(conn, %{"id" => id}) do
    board = Scheme.get_board!(id)
    changeset = Scheme.change_board(board)
    render(conn, "edit.html", board: board, changeset: changeset)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Scheme.get_board!(id)

    case Scheme.update_board(board, board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board updated successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", board: board, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Scheme.get_board!(id)
    {:ok, _board} = Scheme.delete_board(board)

    conn
    |> put_flash(:info, "Board deleted successfully.")
    |> redirect(to: Routes.board_path(conn, :index))
  end
end
