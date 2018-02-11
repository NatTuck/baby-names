defmodule Mix.Tasks.Data.Load do
  use Mix.Task


  def run(_) do
    System.cmd("mix", ["run", "priv/repo/seeds.exs"])
  end
end
