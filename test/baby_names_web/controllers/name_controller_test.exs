defmodule BabyNamesWeb.NameControllerTest do
  use BabyNamesWeb.ConnCase

  alias BabyNames.Baby
  alias BabyNames.Baby.Name

  @create_attrs %{gender: "some gender", name: "some name"}
  @update_attrs %{gender: "some updated gender", name: "some updated name"}
  @invalid_attrs %{gender: nil, name: nil}

  def fixture(:name) do
    {:ok, name} = Baby.create_name(@create_attrs)
    name
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all names", %{conn: conn} do
      conn = get conn, name_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create name" do
    test "renders name when data is valid", %{conn: conn} do
      conn = post conn, name_path(conn, :create), name: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, name_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "gender" => "some gender",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, name_path(conn, :create), name: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update name" do
    setup [:create_name]

    test "renders name when data is valid", %{conn: conn, name: %Name{id: id} = name} do
      conn = put conn, name_path(conn, :update, name), name: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, name_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "gender" => "some updated gender",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, name: name} do
      conn = put conn, name_path(conn, :update, name), name: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete name" do
    setup [:create_name]

    test "deletes chosen name", %{conn: conn, name: name} do
      conn = delete conn, name_path(conn, :delete, name)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, name_path(conn, :show, name)
      end
    end
  end

  defp create_name(_) do
    name = fixture(:name)
    {:ok, name: name}
  end
end
