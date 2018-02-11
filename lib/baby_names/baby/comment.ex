defmodule BabyNames.Baby.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias BabyNames.Baby.Comment


  schema "comments" do
    field :comment, :string
    field :stars, :integer
    belongs_to :name, BabyNames.Baby.Name

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:comment, :stars])
    |> validate_required([:comment, :stars])
  end
end
