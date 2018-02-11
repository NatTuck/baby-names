defmodule BabyNames.Repo.Migrations.CreateNames do
  use Ecto.Migration

  def change do
    create table(:names) do
      add :name, :string, null: false
      add :gender, :string, null: false

      timestamps()
    end

  end
end
