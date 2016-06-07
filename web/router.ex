defmodule Wtfis.Router do
  use Wtfis.Web, :router

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

  scope "/", Wtfis do
    pipe_through :api # Use the default browser stack

    get "/", QueryController, :query
  end

  # Other scopes may use custom stacks.
  # scope "/api", Wtfis do
  #   pipe_through :api
  # end
end
