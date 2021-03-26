defmodule HelloApi.Scheme.Reply do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reply" do
    field :comment, :string
    field :board_key, :integer
    field :user_key, :integer

    timestamps()
  end

  @doc false
  def changeset(reply, attrs) do

    IO.puts("Scheme.Reply  changeset")

    reply
    |> cast(attrs, [:comment, :user_key, :board_key])
    |> validate_required([:comment])
  end
end
