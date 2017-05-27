module Views.Home exposing (html)

import Model exposing (Model)
import Messages exposing (..)
import Auth.User exposing (UserStatus(..), User)
import Html exposing (Html, div, text, h3, img, a)
import Html.Attributes exposing (class, src, href, attribute)


html : Model -> Html Msg
html model =
    let
        homeMarkup : List (Html Msg)
        homeMarkup =
            case model.user of
                UserSignedOut ->
                    [ div [ class "auth" ]
                        [ div [] [ a [ href "/auth/twitter", class "btn btn-success" ] [ text "Sign in" ] ]
                        , img [ src "/images/welcome-unauthed.jpg", class "welcome unauthed" ] []
                        ]
                    ]

                UserSignedIn user ->
                    [ div []
                        [ h3 []
                            [ text ("Hi " ++ user.name)
                            ]
                        , div []
                            [ text "\"Hmm, what should I do with all this?\""
                            ]
                        ]
                    , img [ src "/images/welcome-authed.jpg", class "welcome authed" ] []
                    ]
    in
        div [ class "splash-screen" ]
            homeMarkup
