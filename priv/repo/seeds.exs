# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BabyNames.Repo.insert!(%BabyNames.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule LoadData do
  alias BabyNames.Baby
  alias BabyNames.Baby.Name
  alias BabyNames.Baby.YearName
  alias BabyNames.Baby.Comment

  import Ecto.Query, only: [from: 2]

  def run() do
    BabyNames.Repo.start_link
    BabyNames.Repo.delete_all(Name)
    BabyNames.Repo.delete_all(YearName)
    BabyNames.Repo.delete_all(Comment)

    dir = Path.join(:code.priv_dir(:baby_names), "data")
    files = Path.wildcard("#{dir}/*.txt")

    data = Enum.flat_map files, fn ff ->
      IO.inspect(ff)
      [_, year] = Regex.run(~r/\/yob(\d+)\.txt$/, ff)

      Enum.map File.stream!(ff), fn line ->
        line
        |> String.trim
        |> parse_line(year)
      end
    end

    data = Enum.filter(data, &( &1[:gender] == "F" ))

    unique_names = data
    |> Enum.map(&(%{ name: &1[:name], gender: &1[:gender] }))
    |> Enum.uniq()

    names = Enum.flat_map Enum.chunk_every(unique_names, 1000), fn chunk ->
      {:ok, ys} = BabyNames.Repo.transaction fn ->
        Enum.map(chunk, &( insert_name(&1[:name], &1[:gender]) ))
      end
      ys
    end

    names = names
    |> Enum.map(&( {&1.name, &1}))
    |> Enum.into(%{})

    Enum.each Enum.chunk_every(data, 1000), fn chunk ->
      {:ok, _} = BabyNames.Repo.transaction fn ->
        Enum.each chunk, fn dd ->
          if names[dd[:name]] do
            insert_year(names[dd[:name]], dd[:year], dd[:count])
          else
            raise(inspect(dd))
          end
        end
      end
    end
  end

  def parse_line(line, year) do
    [name, gend, count] = String.split(line, ",")
    year = String.to_integer(year)
    count = String.to_integer(count)

    %{ name: name, gender: gend, year: year, count: count }
  end

  def insert_name(name, gender) do
    record = BabyNames.Repo.one from n in Baby.Name,
      where: n.name == ^name and n.gender == ^gender

    if record do
      record
    else
      BabyNames.Repo.insert!(%Baby.Name{name: name, gender: gender})
    end
  end

  def insert_year(name, year, count) do
    rec = %Baby.YearName{
      name_id: name.id,
      year: year,
      count: count,
    }
    BabyNames.Repo.insert!(rec)
  end
end

LoadData.run


