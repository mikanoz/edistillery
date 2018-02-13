defmodule Edistillery.ReleaseTasks do
  def init do
    :ok = Application.load(:edistillery)

    Enum.each [:ecto, :postgrex, :logger], fn(app) ->
      {:ok, _} = Application.ensure_all_started(app)
    end

    Edistillery.Repo.start_link
  end

  def migrate_pre do
    init()
    Enum.each(repos(), &run_migrations_for(&1, path_for(&1, "migrations_pre")))
  end

  def migrate_post do
    init()
    Enum.each(repos(), &run_migrations_for(&1, path_for(&1, "migrations")))
  end

  def myapp do
    Application.get_application(__MODULE__)
  end

  def repos do
    Application.get_env(myapp(), :ecto_repos, [])
  end

  defp run_migrations_for(repo, path) do
    app = Keyword.get(repo.config, :otp_app)
    IO.puts "running migrations for #{repo} #{app} #{path}"
    Ecto.Migrator.run(repo, path, :up, all: true)
    IO.puts "/finished"
  end

  defp path_for(repo, filename) do
    app = Keyword.get(repo.config, :otp_app)
    repo_underscore = repo |> Module.split |> List.last |> Macro.underscore
    Path.join([priv_dir(app), repo_underscore, filename])
  end

  defp priv_dir(app), do: "#{:code.priv_dir(app)}"
end