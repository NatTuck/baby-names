defmodule BabyNamesWeb.NamesChannel do
  use BabyNamesWeb, :channel
  alias BabyNames.Baby

  def join("names:all", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("search", %{ "query" => qq }, socket) do
    names = Enum.map Baby.search(qq), fn rec ->
      years = Enum.map rec.years, fn year ->
        %{ year: year.year, count: year.count, rank: year.pop_rank }
      end

      rzero = %{ year: 2016, count: 3, rank: 10000 }
      r2016 = Enum.find(years, rzero, &(&1.year == 2016))

      %{
        name: rec.name,
        years: years,
        best_rank: rec.best_rank,
        best_year: rec.best_year,
        rank_2016: r2016.rank,
        krat: rec.krat,
        nrat: rec.nrat,
        proj: rec.proj,
      }
    end

    {:reply, {:ok, %{ "names" => names }}, socket}
  end

  def handle_in("rate", params, socket) do
    %{ "name" => name, "kind" => kind, "value" => value } = params
    nn = Baby.get_name_by_name!(name)
    if kind == "n" do
      {:ok, _} = Baby.update_name(nn, %{ nrat: value })
    else
      {:ok, _} = Baby.update_name(nn, %{ krat: value })
    end
    {:reply, {:ok, %{}}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (names:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
