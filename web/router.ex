defmodule Elmelixirstarter.Router do
  use Elmelixirstarter.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.LoadResource)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.LoadResource)
  end

  scope "/", Elmelixirstarter do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    # Ueberauth
    # See https://github.com/ueberauth/ueberauth_example/blob/master/web/router.ex for example app
    scope "/auth" do
      get("/:provider", AuthController, :request)
      get("/:provider/callback", AuthController, :callback)
      post("/:provider/callback", AuthController, :callback)
      delete("/logout", AuthController, :delete)
    end
  end

  scope "/api", Elmelixirstarter do
    pipe_through(:api)
    get("/me", UserController, :me)
  end
end
