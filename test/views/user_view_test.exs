defmodule Elmelixirstarter.UserViewTest do
  use Elmelixirstarter.ModelCase

  alias Elmelixirstarter.UserView

  import Elmelixirstarter.Factory

  test "#show renders the user" do
    user = insert(:user)

    assert UserView.render("show.json", %{user: user}) == %{
             id: user.id,
             name: user.name,
             image_url: user.image_url,
             username: user.username
           }
  end
end
