defmodule Elmelixirstarter.GuardianSerializer do
  @moduledoc """
  This module handles serialization and deserialization of user info from the session storage so
  that you can identify the user after auth.
  """

  @behaviour Guardian.Serializer

  alias Elmelixirstarter.Repo
  alias Elmelixirstarter.User

  # Sample implementation adapted from https://github.com/ueberauth/guardian
  def for_token(%User{} = user), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> ""), do: {:error, "ID not provided"}
  def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
