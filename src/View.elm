module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Login.View
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
  div []
    [ page model ]


page : Model -> Html Msg
page model =
  case model.route of
    LoginRoute ->
      Html.App.map LoginMsg (Login.View.view model.username)

    NotFoundRoute ->
      notFoundView


notFoundView : Html msg
notFoundView =
  div []
    [ text "Not found"
    ]
