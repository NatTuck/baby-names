defmodule BabyNames.Repo.Migrations.AddRanks do
  use Ecto.Migration

  import Ecto.Query

  alias BabyNames.Repo
  alias BabyNames.Baby
  alias BabyNames.Baby.Name
  alias BabyNames.Baby.YearName

  def up do
    alter table("year_names") do
      add :pop_rank, :integer
    end

    alter table("names") do
      add :best_year, :integer
      add :best_rank, :integer
    end

    #Enum.each 1880..2016, fn year ->
    #  yns = Repo.all from yn in YearName,
    #    where: yn.year == ^year,
    #    order_by: [desc: yn.count]
    #  Enum.each Enum.with_index(yns, 1), fn {yn, ii} ->
    #    Baby.update_year_name(yn, %{ pop_rank: ii })
    #  end
    #end

    #names = Baby.list_names()
    #|> Repo.preload(:years)

    #Enum.each names, fn name ->
    #end
  end

  def down do
    alter table("names") do
      remove :best_year
      remove :best_rank
    end

    alter table("year_names") do
      remove :pop_rank
    end
  end
end
