module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Login.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LoginMsg subMsg ->
      let
        ( user, cmd ) =
          Login.Update.update subMsg model.user
      in
        ( { model | user = user}
        , Cmd.map LoginMsg cmd )
