defmodule Elmelixirstarter.UserController do
  use Elmelixirstarter.Web, :controller
  use Guardian.Phoenix.Controller

  plug(Guardian.Plug.EnsureAuthenticated, handler: Elmelixirstarter.AuthErrorHandler)

  def me(conn, _params, user, _claims) do
    render(conn, "show.json", user: user)
  end
end
