defmodule Mix.Tasks.Data.Fetch do
  use Mix.Task

  def run(_) do
    url = "https://www.ssa.gov/oact/babynames/names.zip"
    dir = Path.join(:code.priv_dir(:baby_names), "data")
    {_, 0} = System.cmd("wget", ["-c", "-O", "#{dir}/names.zip", url])
    {_, 0} = System.cmd("bash", ["-c", "(cd '#{dir}' && unzip names.zip)"])
  end
end
