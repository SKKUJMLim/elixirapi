defmodule HelloApiWeb.UserController do
  use HelloApiWeb, :controller

  alias HelloApi.Scheme
  alias HelloApi.Scheme.User

  def index(conn, _params) do
    users = Scheme.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Scheme.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Scheme.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    user = Scheme.get_user!(id)

    reply = Scheme.get_reply_list_by_userid(id)
    board = Scheme.get_board_list_by_userid(id)
    IO.inspect(board)

    render(conn, "show.html", user: user, reply: reply, board: board)
  end

  def edit(conn, %{"id" => id}) do
    user = Scheme.get_user!(id)
    changeset = Scheme.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Scheme.get_user!(id)

    case Scheme.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Scheme.get_user!(id)
    {:ok, _user} = Scheme.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
