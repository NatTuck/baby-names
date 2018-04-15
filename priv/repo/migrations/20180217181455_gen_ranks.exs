defmodule BabyNames.Repo.Migrations.GenRanks do
  use Ecto.Migration

  import Ecto.Query

  alias BabyNames.Repo
  alias BabyNames.Baby
  alias BabyNames.Baby.Name
  alias BabyNames.Baby.YearName

  def up do
    Logger.configure(level: :info)

    Enum.each 1880..2016, fn year ->
      yns = Repo.all from yn in YearName,
        where: yn.year == ^year,
        order_by: [desc: yn.count]
      Enum.each Enum.with_index(yns, 1), fn {yn, ii} ->
        Baby.update_year_name(yn, %{ pop_rank: ii })
      end
    end
  end

  def down do
  end
end
