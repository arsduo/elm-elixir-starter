defmodule Elmelixirstarter.AuthErrorHandler do
  @moduledoc """
  Your controllers can invoke this handler to render an unauthenticated response.
  """

  use Elmelixirstarter.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(unauthenticated_response())
  end

  def unauthenticated_response do
    %{"error" => "Unauthorized!"}
  end
end
