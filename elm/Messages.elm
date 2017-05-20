module Messages exposing (..)

import Http
import Auth.User exposing (User)


type Msg
    = UserStateChecked (Result Http.Error User)
