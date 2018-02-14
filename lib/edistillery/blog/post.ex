defmodule Edistillery.Blog.Post do
  use Ecto.Schema
  require Logger
  import Ecto.Changeset
  import Ecto.Query

  alias Edistillery.Blog.Post
  alias Edistillery.Repo

  schema "blog_posts" do
    field :counter, :integer
    field :title, :string
    field :views, :integer

    timestamps()
  end

  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :views, :counter])
    |> validate_required([:title, :views, :counter])
  end

  def seed do
    Task.Supervisor.async_nolink(Edistillery.TaskSupervisor, fn ->
      post = %Post{}
             |> Post.changeset(%{title: "title", views: 1, counter: 2})
             |> Repo.insert!

      repeat_read_counter(post.id)
    end)
  end

  def repeat_read_counter(id) do
    from(p in Post, where: p.id == ^id, select: p.counter)
    :timer.sleep(1000)
    Logger.info "post read 0.0.6"
    repeat_read_counter(id)
  end
end
