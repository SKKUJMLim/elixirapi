defmodule HelloApi.Repo.Migrations.CreateNormalNobelRef do
  use Ecto.Migration

  def change do
    create table(:normal_nobel_ref) do
      add :normal_key, references(:users, on_delete: :delete_all)
      add :nobel_key, references(:users, on_delete: :delete_all)
      timestamps()
    end
  end
end
