defmodule BabyNames.Baby.Name do
  use Ecto.Schema
  import Ecto.Changeset
  alias BabyNames.Baby.Name


  schema "names" do
    field :gender, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Name{} = name, attrs) do
    name
    |> cast(attrs, [:name, :gender])
    |> validate_required([:name, :gender])
  end
end
