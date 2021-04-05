defmodule HelloApi.Scheme.NormalNobel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "normal_nobel_ref" do
    belongs_to :normal, HelloApi.Scheme.User, foreign_key: :normal_key
    belongs_to :nobel, HelloApi.Scheme.User, foreign_key: :nobel_key
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :password, :name, :phonenum])
    |> validate_required([:user_id, :password, :name, :phonenum])
  end
end
