module Auth exposing (AuthMsg)

import Model exposing (Model)
import Auth.User exposing (User, UserStatus)


update : UserStatus -> Model -> Model
update userStatus model =
    { model | user = userStatus }
