defmodule Elmelixirstarter.AuthErrorHandlerTest do
  use Elmelixirstarter.ConnCase

  alias Elmelixirstarter.AuthErrorHandler

  test "unauthenticated error handler", %{conn: conn} do
    conn = AuthErrorHandler.unauthenticated(conn, %{})
    assert json_response(conn, 401) == %{"error" => "Unauthorized!"}
  end
end
