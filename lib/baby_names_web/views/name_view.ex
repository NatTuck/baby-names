defmodule BabyNamesWeb.NameView do
  use BabyNamesWeb, :view
  alias BabyNamesWeb.NameView

  def render("index.json", %{names: names}) do
    %{data: render_many(names, NameView, "name.json")}
  end

  def render("show.json", %{name: name}) do
    %{data: render_one(name, NameView, "name.json")}
  end

  def render("name.json", %{name: name}) do
    %{id: name.id,
      name: name.name,
      gender: name.gender}
  end
end
