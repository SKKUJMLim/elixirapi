defmodule HelloApiWeb.Router do
  use HelloApiWeb, :router

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

  scope "/", HelloApiWeb do
    pipe_through :browser

    resources "/", PageController, only: [:create, :index]

    resources "/users", UserController

    resources "/board", BoardController do
      resources "/reply", ReplyController
    end


  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloApiWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HelloApiWeb.Telemetry
    end
  end
end
