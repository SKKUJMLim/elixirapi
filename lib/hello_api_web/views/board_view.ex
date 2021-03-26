defmodule HelloApiWeb.BoardView do
  use HelloApiWeb, :view

  alias HelloApi.Scheme

  def get_user_info(reply), do: Scheme.get_user_byID(reply.user_key)
  def get_username_by_userid(user), do: user.user_id

end
