defmodule Elmelixirstarter.PageController do
  use Elmelixirstarter.Web, :controller
  use Guardian.Phoenix.Controller

  def index(conn, _params, _current_user, _claims) do
    render conn, "index.html"
  end
end
