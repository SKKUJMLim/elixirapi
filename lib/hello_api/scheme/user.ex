defmodule HelloApi.Scheme.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    field :phonenum, :string
    field :user_id, :string
    many_to_many  :nobel, HelloApi.Scheme.User,
                  join_through: HelloApi.Scheme.NormalNobel,
                  join_keys: [{:normal_id, :id}, {:nobel_id, :id}]
    many_to_many  :normal, HelloApi.Scheme.User,
                  join_through: HelloApi.Scheme.NormalNobel,
                  join_keys: [{:nobel_id, :id}, {:normal_id, :id}]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :password, :name, :phonenum])
    |> validate_required([:user_id, :password, :name, :phonenum])
  end
end
