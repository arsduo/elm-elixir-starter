module Auth.User exposing (User, UserStatus(..))


type UserStatus
    = UserSignedOut
    | UserSignedIn User


type alias User =
    { id : Int
    , name : String
    , username : String
    , picture_url : String
    }
