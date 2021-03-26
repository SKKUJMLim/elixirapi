defmodule HelloApi.Repo.Migrations.AlterAddFieldToBoard do
  use Ecto.Migration

  def change do
    alter table(:board) do
      add :user_key, references(:users, on_delete: :delete_all)
    end
  end
end
