module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Login.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    PhoenixMsg subMsg ->
      let
        ( phxSocket, phxCmd ) =
          Phoenix.Socket.update subMsg model.socket
      in
        ( { model | socket = phxSocket }
        , Cmd.map PhoenixMsg phxCmd
        )

    LoginMsg subMsg ->
      let
        ( model, cmd ) =
          Login.Update.update subMsg model.user
      in
        ( model, Cmd.map LoginMsg cmd )
