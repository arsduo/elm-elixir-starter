defmodule Elmelixirstarter.AuthControllerTest do
  use Elmelixirstarter.ConnCase

  alias Elmelixirstarter.Repo
  alias Elmelixirstarter.User

  describe "#callback with omniauth failure" do
    test "redirects to home without creating a user" do
      conn = build_conn()
      conn = assign(conn, :ueberauth_failure, %{})

      conn = post conn, "/auth/twitter/callback"
      assert redirected_to(conn) == "/"
      assert Repo.aggregate(User, :count, :id) == 0
    end
  end

  describe "#callback with omniauth success" do
    setup do
      base_context = [
        twitter_uid: "123",
        # in Ueberauth, for some reason token and secret come in as chars not strings like everything else >:O
        token: 'foo',
        secret: 'bar',
        name: "A name",
        screenname: "a_screenname",
        image_url: "a url"
      ]
      context = base_context ++ [
        ueberauth_params: %{
          credentials: %{
            secret: base_context[:secret],
            token: base_context[:token],
            token_type: nil
          },
          extra: %{
            raw_info: %{
              token: 'some_other_token',
              user: %{
                "id" => 15790393,
                "profile_image_url" => "http://pbs.twimg.com/profile_images/414776155590623232/HuQHFxhw_normal.jpeg",
                "location" => "Chicago",
                "name" => "Alex Koppel",
                "url" => "https://t.co/BEpi01CxV8",
                "description" => "ex-expat, book reader, principal ☃ engineer at @esparklearning, part of @chicagoawesome. Jew. Gay.",
                "profile_image_url_https" => "https://pbs.twimg.com/profile_images/414776155590623232/HuQHFxhw_normal.jpeg",
                "screen_name" => "arsduo"
              }
            }
          },
          info: %{
            description: "ex-expat, book reader, principal ☃ engineer at @esparklearning, part of @chicagoawesome. Jew. Gay.",
            image: base_context[:image_url],
            name: base_context[:name],
            nickname: base_context[:screenname]
          },
          provider: :twitter,
          strategy: Ueberauth.Strategy.Twitter,
          uid: base_context[:twitter_uid]
        }
      ]
      {:ok, context}
    end

    test "creates a user appropriately if none exists", context do
      conn = build_conn()
      conn = assign(conn, :ueberauth_auth, context[:ueberauth_params])

      conn = post conn, "/auth/twitter/callback"

      user = (from u in User, where: u.twitter_user_id == ^context[:twitter_uid]) |> Repo.one!
      assert user.name == context[:name]
      assert user.username == context[:screenname]
      assert user.provider_token == to_string(context[:token])
      assert user.provider_secret == to_string(context[:secret])
      assert user.image_url == context[:image_url]
    end

    test "redirects to / if none exists", context do
      conn = build_conn()
      conn = assign(conn, :ueberauth_auth, context[:ueberauth_params])

      conn = post conn, "/auth/twitter/callback"

      assert redirected_to(conn) == "/"
    end

    test "updates a user appropriately if a user already exists", context do
      Repo.insert(User.changeset(%User{}, %{
                    twitter_user_id: context[:twitter_uid],
                    provider_token: "another token",
                    provider_secret: "another screenname",
                    name: "dunno",
                    username: "something",
                    image_url: "gopher://images.net"
                  }))
      conn = build_conn()
      conn = assign(conn, :ueberauth_auth, context[:ueberauth_params])

      conn = post conn, "/auth/twitter/callback"

      user = (from u in User, where: u.twitter_user_id == ^context[:twitter_uid]) |> Repo.one!
      assert user.name == context[:name]
      assert user.username == context[:screenname]
      assert user.provider_token == to_string(context[:token])
      assert user.provider_secret == to_string(context[:secret])
      assert user.image_url == context[:image_url]
    end

    test "redirects to / if a user already exists", context do
      Repo.insert(User.changeset(%User{}, %{
                    twitter_user_id: context[:twitter_uid],
                    provider_token: "another token",
                    provider_secret: "another screenname",
                    name: "dunno",
                    username: "something",
                    image_url: "gopher://images.net"
                  }))
      conn = build_conn()
      conn = assign(conn, :ueberauth_auth, context[:ueberauth_params])

      conn = post conn, "/auth/twitter/callback"

      assert redirected_to(conn) == "/"
    end
  end
end