defmodule HelloApi.Repo.Migrations.AlterAddFieldToReply do
  use Ecto.Migration

  def change do
    alter table(:reply) do
      add :user_key, references(:users, on_delete: :delete_all)
      add :board_key, references(:board, on_delete: :delete_all)
    end
  end
end
