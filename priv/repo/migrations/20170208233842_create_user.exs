defmodule Elmelixirstarter.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :twitter_user_id, :bigint
      add :image_url, :string
      add :provider_secret, :string
      add :provider_token, :string

      timestamps()
    end

    unique_index(:users, [:twitter_user_id])
  end
end
