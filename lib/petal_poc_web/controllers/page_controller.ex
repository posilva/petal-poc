defmodule PetalPocWeb.PageController do
  use PetalPocWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
