defmodule ElixirPhoenixExampleApp.PageController do
  use ElixirPhoenixExampleApp.Web, :controller

  def boom do
    raise "boom"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end
