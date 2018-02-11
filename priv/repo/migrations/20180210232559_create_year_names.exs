defmodule BabyNames.Repo.Migrations.CreateYearNames do
  use Ecto.Migration

  def change do
    create table(:year_names) do
      add :year, :integer, null: false
      add :count, :integer, null: false
      add :name_id, references(:names, on_delete: :delete_all)

      timestamps()
    end

    create index(:year_names, [:name_id])
  end
end
