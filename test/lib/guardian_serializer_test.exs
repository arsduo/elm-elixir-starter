defmodule Elmelixirstarter.GuardianSerializerTest do
  use Elmelixirstarter.ModelCase
  import Elmelixirstarter.Factory

  alias Elmelixirstarter.GuardianSerializer

  describe "#for_token" do
    test "when given a user, it returns the right string" do
      user = insert(:user)
      assert GuardianSerializer.for_token(user) == {:ok, "User:#{user.id}"}
    end

    test "when given something else, it returns an error" do
      almost_user = %{
        name: "A name",
        image_url: "gopher://images.biz",
        username: "user username",
        provider_secret: "some secret",
        provider_token: "some pig"
      }
      expected_result = {:error, "Unknown resource type"}
      assert GuardianSerializer.for_token(almost_user) == expected_result
      assert GuardianSerializer.for_token(%{}) == expected_result
      assert GuardianSerializer.for_token(nil) == expected_result
    end
  end

  describe "#from_token" do
    test "when given the right string, it returns the stored user" do
      user = insert(:user)
      assert GuardianSerializer.from_token("User:#{user.id}") == {:ok, user}
    end

    test "when given an ID for a user that doesn't exist, it returns nil" do
      assert GuardianSerializer.from_token("User:1231412") == {:ok, nil}
    end

    test "when missing an ID, it gives an appropriate error" do
      assert GuardianSerializer.from_token("User:") == {:error, "ID not provided"}
    end

    test "when given something else, it returns an appropriate error" do
      expected_result = {:error, "Unknown resource type"}
      assert GuardianSerializer.from_token("") == expected_result
      assert GuardianSerializer.from_token(nil) == expected_result
    end
  end
end
