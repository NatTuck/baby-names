defmodule BabyNames.Repo.Migrations.FindPeaks do
  use Ecto.Migration

  alias BabyNames.Repo
  alias BabyNames.Baby
  alias BabyNames.Baby.Name
  alias BabyNames.Baby.YearName

  def change do
    names = Baby.list_names()
    |> Repo.preload(:years)

    Enum.each names, fn name ->
      best = Enum.min_by(name.years, &( &1.pop_rank ))
      Baby.update_name(name, %{ best_year: best.year, best_rank: best.pop_rank })
    end
  end

  def down do
  end
end
