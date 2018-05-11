defmodule Elmelixirstarter.AuthController do
  use Elmelixirstarter.Web, :controller

  plug(Ueberauth)

  alias Elmelixirstarter.User

  # see example at
  # https://github.com/ueberauth/ueberauth_example/blob/master/web/controllers/auth_controller.ex
  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    {:ok, user} = lookup_and_update_user(auth) || save_user_data(%User{}, auth)

    conn
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/")
  end

  defp lookup_and_update_user(auth) do
    if user = lookup_user(auth) do
      save_user_data(user, auth)
    end
  end

  defp lookup_user(%{uid: twitter_uid}) do
    {uid, _} = Integer.parse(twitter_uid)
    Repo.one(from(u in User, where: u.twitter_user_id == ^uid))
  end

  defp save_user_data(user, %{
         uid: twitter_uid,
         credentials: %{token: token, secret: secret},
         info: %{name: name, nickname: screenname, image: image_url}
       }) do
    changeset =
      User.changeset(user, %{
        twitter_user_id: twitter_uid,
        # in Ueberauth, for some reason token and secret come in as chars not strings like everything else >:O
        provider_token: to_string(token),
        provider_secret: to_string(secret),
        name: name,
        username: screenname,
        image_url: image_url
      })

    {:ok, _changeset} = Repo.insert_or_update(changeset)
  end
end
