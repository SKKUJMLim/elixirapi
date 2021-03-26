defmodule HelloApi.Repo.Migrations.CreateReply do
  use Ecto.Migration

  def change do
    create table(:reply) do
      add :comment, :string

      timestamps()
    end

  end
end
