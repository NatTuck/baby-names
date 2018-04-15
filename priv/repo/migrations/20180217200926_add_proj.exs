defmodule BabyNames.Repo.Migrations.AddProj do
  use Ecto.Migration

  def change do
    alter table("names") do
      add :proj, :integer
    end
  end
end
