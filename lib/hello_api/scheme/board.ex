defmodule HelloApi.Scheme.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "board" do
    field :content, :string
    field :title, :string
    field :user_key, :integer

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title, :content, :user_key])
    |> validate_required([:title, :content, :user_key])
  end
end
