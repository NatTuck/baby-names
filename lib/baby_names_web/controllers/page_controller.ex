defmodule BabyNamesWeb.PageController do
  use BabyNamesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
