defmodule BabyNames.Repo.Migrations.AddRats do
  use Ecto.Migration

  def change do
    alter table("names") do
      add :krat, :integer
      add :nrat, :integer
    end
  end
end
