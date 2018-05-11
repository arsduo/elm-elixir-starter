defmodule Elmelixirstarter.UserView do
  use Elmelixirstarter.Web, :view

  def render("show.json", %{user: user}) do
    user_json(user)
  end

  defp user_json(user) do
    %{
      id: user.id,
      name: user.name,
      image_url: user.image_url,
      username: user.username
    }
  end
end
