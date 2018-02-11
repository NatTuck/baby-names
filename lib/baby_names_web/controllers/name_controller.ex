defmodule BabyNamesWeb.NameController do
  use BabyNamesWeb, :controller

  alias BabyNames.Baby
  alias BabyNames.Baby.Name

  action_fallback BabyNamesWeb.FallbackController

  def index(conn, _params) do
    names = Baby.list_names()
    render(conn, "index.json", names: names)
  end

  def create(conn, %{"name" => name_params}) do
    with {:ok, %Name{} = name} <- Baby.create_name(name_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", name_path(conn, :show, name))
      |> render("show.json", name: name)
    end
  end

  def show(conn, %{"id" => id}) do
    name = Baby.get_name!(id)
    render(conn, "show.json", name: name)
  end

  def update(conn, %{"id" => id, "name" => name_params}) do
    name = Baby.get_name!(id)

    with {:ok, %Name{} = name} <- Baby.update_name(name, name_params) do
      render(conn, "show.json", name: name)
    end
  end

  def delete(conn, %{"id" => id}) do
    name = Baby.get_name!(id)
    with {:ok, %Name{}} <- Baby.delete_name(name) do
      send_resp(conn, :no_content, "")
    end
  end
end
