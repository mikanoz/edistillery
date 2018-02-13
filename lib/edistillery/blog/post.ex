defmodule Edistillery.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Edistillery.Blog.Post


  schema "blog_posts" do
    field :counter, :integer
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :views, :counter])
    |> validate_required([:title, :views, :counter])
  end
end
