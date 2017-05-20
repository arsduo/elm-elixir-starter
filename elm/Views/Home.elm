module Views.Home exposing (html)

import Model exposing (Model)
import Messages exposing (..)
import Auth.User exposing (UserStatus(..), User)
import Html exposing (Html, div, text, span, img, a)
import Html.Attributes exposing (class, src, href, attribute)
import Html.Events exposing (onClick)
import Http exposing (encodeUri)


-- TODO this may not be the right place to generate this, since it's ultimately sent out over a port.


html : Model -> Html Msg
html model =
    case model.user of
        UserSignedOut ->
            div []
                [ a [ href "/auth/twitter" ] [ text "Sign in" ]
                ]

        UserSignedIn user ->
            div []
                [ div [] [ text ("Hi " ++ user.name) ]
                ]
