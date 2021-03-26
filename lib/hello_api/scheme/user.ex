defmodule HelloApi.Scheme.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    field :phonenum, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :password, :name, :phonenum])
    |> validate_required([:user_id, :password, :name, :phonenum])
  end
end
