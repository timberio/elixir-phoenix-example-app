defmodule ElixirPhoenixExampleApp.Router do
  use ElixirPhoenixExampleApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirPhoenixExampleApp do
    pipe_through :browser # Use the default browser stack

    get "/boom", PageController, :boom
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirPhoenixExampleApp do
  #   pipe_through :api
  # end
end
