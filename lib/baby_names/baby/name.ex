defmodule BabyNames.Baby.Name do
  use Ecto.Schema
  import Ecto.Changeset
  alias BabyNames.Baby.Name


  schema "names" do
    field :gender, :string
    field :name, :string
    field :best_year, :integer
    field :best_rank, :integer
    field :proj, :integer
    field :krat, :integer
    field :nrat, :integer
    has_many :years, BabyNames.Baby.YearName

    timestamps()
  end

  @doc false
  def changeset(%Name{} = name, attrs) do
    name
    |> cast(attrs, [:name, :gender, :best_year, :proj, :best_rank, :krat, :nrat])
    |> validate_required([:name, :gender])
  end
end
