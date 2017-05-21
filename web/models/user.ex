defmodule Elmelixirstarter.User do
  use Elmelixirstarter.Web, :model

  schema "users" do
    field :name, :string
    field :image_url, :string
    field :username, :string
    field :twitter_user_id, :integer
    field :provider_secret, :string
    field :provider_token, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :image_url, :username, :provider_secret, :provider_token, :twitter_user_id])
    |> validate_required([:name, :image_url, :username, :provider_secret, :provider_token, :twitter_user_id])
  end
end
