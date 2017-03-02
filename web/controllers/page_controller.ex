defmodule ElixirPhoenixExampleApp.PageController do
  use ElixirPhoenixExampleApp.Web, :controller

  def boom(conn, _params) do
    raise "boom"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end
