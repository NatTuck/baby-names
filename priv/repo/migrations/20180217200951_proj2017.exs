defmodule BabyNames.Repo.Migrations.Proj2017 do
  use Ecto.Migration

  alias BabyNames.Repo
  alias BabyNames.Baby
  alias BabyNames.Baby.Name
  alias BabyNames.Baby.YearName

  defp calc_proj(y0, y1) do
    r0 = y0.pop_rank
    r1 = y1.pop_rank
    dr = r1 - r0
    r1 + dr
  end

  def up do
    names = Baby.list_names()
    |> Repo.preload(:years)

    Enum.each names, fn name ->
      yzero = %YearName{ count: 0, year: 0, pop_rank: 10000 }
      y2014 = Enum.find(name.years, yzero, &(&1.year == 2014))
      y2016 = Enum.find(name.years, yzero, &(&1.year == 2016))
      Baby.update_name(name, %{ proj: calc_proj(y2014, y2016) })
    end
  end

  def down do
  end
end
