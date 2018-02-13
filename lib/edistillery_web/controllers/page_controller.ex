defmodule EdistilleryWeb.PageController do
  use EdistilleryWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
