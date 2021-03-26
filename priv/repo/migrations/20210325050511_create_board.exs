defmodule HelloApi.Repo.Migrations.CreateBoard do
  use Ecto.Migration

  def change do
    create table(:board) do
      add :title, :string
      add :content, :string

      timestamps()
    end

  end
end
