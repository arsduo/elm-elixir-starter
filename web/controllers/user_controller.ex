defmodule Elmelixirstarter.UserController do
  use Elmelixirstarter.Web, :controller
  use Guardian.Phoenix.Controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Elmelixirstarter.AuthErrorHandler

  alias Elmelixirstarter.User

  def me(conn, _params, user, claims) do
    render conn, "show.json", user: user
  end
end

