defmodule ReleaseTasks do
  @start_apps [
    :crypto,
    :ssl,
    :postgrex,
    :ecto
  ]

  def myapp, do: Application.get_application(__MODULE__)

  def repositories, do: Application.get_env(myapp(), :ecto_repos, [])

  def migrate, do: Enum.each(repositories(), &run_migrations_for(&1, path_for(&1, "migrations")))

  def migrate_pre, do: Enum.each(repositories(), &run_migrations_for(&1, path_for(&1, "migrations_pre")))

  def priv_dir(app), do: "#{:code.priv_dir(app)}"

  defp run_migrations_for(repo, path) do
    app = Keyword.get(repo.config, :otp_app)
    IO.puts "Running migrations for #{app} #{path}"
    Ecto.Migrator.run(repo, path, :up, all: true)
    IO.puts "Finished migrations for #{app} #{path}"
  end

  def path_for(repo, filename) do
    app = Keyword.get(repo.config, :otp_app)
    repo_underscore = repo |> Module.split |> List.last |> Macro.underscore
    Path.join([priv_dir(app), repo_underscore, filename])
  end
end