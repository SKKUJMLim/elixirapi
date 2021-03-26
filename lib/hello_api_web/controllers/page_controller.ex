defmodule HelloApiWeb.PageController do
  use HelloApiWeb, :controller

  alias HelloApi.Scheme
  alias HelloApi.Scheme.User

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"user" => user_params}) do

    IO.puts("PageController create")

    user = Scheme.get_user_by_uid(user_params["userid"], user_params["password"])
    #IO.inspect(user.id)

    case user do
      nil ->
        IO.puts("nil")
        conn
        |> put_flash(:error, "Login fail.")
        |> redirect(to: Routes.page_path(conn, :index))
      _ ->
        IO.puts("_____")
        conn
        |> put_session(:current_user, user.id)
        |> redirect(to: Routes.board_path(conn, :index))

    end
  end

end
