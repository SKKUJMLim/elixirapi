defmodule HelloApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :string
      add :password, :string
      add :name, :string
      add :phonenum, :string

      timestamps()
    end

  end
end
