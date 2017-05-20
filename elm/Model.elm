module Model exposing (Model, init)

import Auth.User exposing (UserStatus(..), User)


type alias Model =
    { user : UserStatus
    }


init : Model
init =
    { user = UserSignedOut }
