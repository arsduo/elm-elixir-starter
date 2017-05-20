defmodule Elmelixirstarter.UserTest do
  use Elmelixirstarter.ModelCase

  alias Elmelixirstarter.User

  @valid_attrs %{image_url: "some content", name: "some content", username: "some content", provider_secret: "some content", provider_token: "some content", twitter_user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
