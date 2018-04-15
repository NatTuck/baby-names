defmodule BabyNames.Baby.YearName do
  use Ecto.Schema
  import Ecto.Changeset
  alias BabyNames.Baby.YearName

  schema "year_names" do
    field :count, :integer
    field :year, :integer
    field :pop_rank, :integer
    belongs_to :name, BabyNames.Baby.Name

    timestamps()
  end

  @doc false
  def changeset(%YearName{} = year_name, attrs) do
    year_name
    |> cast(attrs, [:year, :count, :pop_rank, :name_id])
    |> validate_required([:year, :count, :name_id])
  end
end
