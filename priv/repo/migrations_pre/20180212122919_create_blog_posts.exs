defmodule Edistillery.Repo.Migrations.CreateBlogPostComments do
  use Ecto.Migration

  def change do
    create table(:blog_post_comments) do
      add :title, :string
      add :likes, :integer
      add :blog_post_id, references(:blog_posts)

      timestamps()
    end
  end
end
