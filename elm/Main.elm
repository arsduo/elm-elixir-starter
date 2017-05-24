module Main exposing (..)

-- Core App stuff

import Model exposing (Model)
import Messages exposing (..)
import Auth.User exposing (UserStatus(..))
import Api.UserApi as UserApi


-- Views

import Html exposing (Html)
import Views.Home as Home


main : Program Never Model Msg
main =
    Html.program { init = ( Model.init, UserApi.validateUser ), view = view, update = update, subscriptions = subscriptions }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UserStateChecked (Ok user) ->
            ( { model | user = (UserSignedIn user) }, Cmd.none )

        UserStateChecked (Err err) ->
            ( { model | user = UserSignedOut }, Cmd.none )


view : Model -> Html Msg
view model =
    Home.html model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
