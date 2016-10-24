module Login.View exposing (..)

import Html exposing (Html, form, input, div, button, text)
import Html.Attributes exposing (placeholder, type')
import Html.Events exposing (onClick, onInput)
import Models exposing (Model)
import Types exposing (User)
import Messages
import Login.Messages exposing (Msg(..))
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
  div [] [ page model ]


page : Model -> Html Msg
page model =
  case model.route of
    LoginRoute ->
      loginPage model

    NotFoundRoute ->
      notFoundPage

    -- case model.route of
    --     PlayersRoute ->
    --         Html.App.map PlayersMsg (Players.List.view model.players)
    --
    --     PlayerRoute id ->
    --         playerEditPage model id
    --
    --     NotFoundRoute ->
    --         notFoundView


loginPage : Model -> Html Msg
loginPage model =
  div []
    [ form []
      [ input [ type' "text", placeholder "Username", onInput Username ] []
      , input [ type' "password", placeholder "Password", onInput Password] []
      -- , viewValidation model.status
      , button [] [ text "Log in" ]
      -- , button [ onClick (Messages.LoginMsg DoLogin) ] [ text "Log in" ]
      ]
    ]

-- playerEditPage : Model -> PlayerId -> Html Msg
-- playerEditPage model playerId =
--     let
--         maybePlayer =
--             model.players
--                 |> List.filter (\player -> player.id == playerId)
--                 |> List.head
--     in
--         case maybePlayer of
--             Just player ->
--                 Html.App.map PlayersMsg (Players.Edit.view player)
--
--             Nothing ->
--                 notFoundView

viewValidation: String -> Html Msg
viewValidation status =
  div [] [ text status ]



notFoundPage : Html msg
notFoundPage =
  div []
    [ text "Not found"
    ]
