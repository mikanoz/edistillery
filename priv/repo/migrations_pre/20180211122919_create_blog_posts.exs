defmodule Edistillery.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add :title, :string
      add :views, :integer
      add :counter, :integer

      timestamps()
    end

  end
end
