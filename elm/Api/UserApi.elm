module Api.UserApi exposing (..)

import Http
import Json.Decode as Json exposing (..)
import Auth.User exposing (User, UserStatus(..))
import Messages


userDecoder : Decoder User
userDecoder =
    -- it's possible that id could be blank if we're getting back invalid user data from the create API
    Json.map4 User
        (field "id" int)
        (field "name" string)
        (field "image_url" string)
        (field "username" string)



-- Lookup


validateUser : Cmd Messages.Msg
validateUser =
    let
        userIndexUrl =
            "/api/me"

        getRequest =
            Http.get userIndexUrl userDecoder
    in
        Http.send Messages.UserStateChecked getRequest
