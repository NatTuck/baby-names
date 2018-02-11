defmodule BabyNames.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :text
      add :stars, :integer
      add :name_id, references(:names, on_delete: :delete_all)

      timestamps()
    end

    create index(:comments, [:name_id])
  end
end
