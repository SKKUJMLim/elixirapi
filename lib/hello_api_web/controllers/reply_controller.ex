defmodule HelloApiWeb.ReplyController do
  use HelloApiWeb, :controller

  alias HelloApi.Scheme
  alias HelloApi.Scheme.Reply

  def index(conn, _params) do

    IO.puts("ReplyController index === ")
    reply = Scheme.list_reply()
    render(conn, "index.html", reply: reply)
  end

  def new(conn, %{"board_id" => board_key}) do

    changeset = Scheme.change_reply(%Reply{})
    render(conn, "new.html", changeset: changeset, board_key: board_key)

  end

  def create(conn, %{"board_id"=> board_key, "reply" => reply_params}) do

    user_key = get_session(conn, :current_user)

    reply_params = Map.put(reply_params, "board_key", board_key)
    reply_params = Map.put(reply_params, "user_key", user_key)

    case Scheme.create_reply(reply_params) do
      {:ok, reply} ->
        board = Scheme.get_board!(board_key)
        conn
        |> put_flash(:info, "Reply created successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:erroe, "Reply fail.")
    end
  end

  # def show(conn, %{"id" => id}) do
  #   reply = Scheme.get_reply!(id)
  #   render(conn, "show.html", reply: reply)
  # end

  # def edit(conn, %{"id" => id}) do
  #   reply = Scheme.get_reply!(id)
  #   changeset = Scheme.change_reply(reply)
  #   render(conn, "edit.html", reply: reply, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "reply" => reply_params}) do
  #   reply = Scheme.get_reply!(id)

  #   case Scheme.update_reply(reply, reply_params) do
  #     {:ok, reply} ->
  #       conn
  #       |> put_flash(:info, "Reply updated successfully.")
  #       #|> redirect(to: Routes.reply_path(conn, :show, reply))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", reply: reply, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   reply = Scheme.get_reply!(id)
  #   {:ok, _reply} = Scheme.delete_reply(reply)

  #   conn
  #   |> put_flash(:info, "Reply deleted successfully.")
  #   #|> redirect(to: Routes.reply_path(conn, :index))
  # end
end
