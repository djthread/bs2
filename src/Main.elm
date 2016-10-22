module Main exposing (..)

import Navigation
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
-- import Players.Commands exposing (fetchAll)
import Login.Commands exposing (doLogin)
import Routing exposing (Route)
import Phoenix.Socket


init : Result String Route -> ( Model, Cmd Msg )
init result =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    ( initialModel currentRoute, Cmd.none )
    -- ( initialModel currentRoute, Cmd.map PlayersMsg fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
  Phoenix.Socket.listen model.socket PhoenixMsg


urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    ( { model | route = currentRoute }, Cmd.none )


main : Program Never
main =
  Navigation.program Routing.parser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }
