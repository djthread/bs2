module Login.Update exposing (..)

import Models exposing (Model)
import Types exposing (User, Shows)
import Login.Messages exposing (Msg(..))
import Login.Commands exposing (doLogin)
import Navigation


-- changeLevelCommands : PlayerId -> Int -> List Player -> List (Cmd Msg)
-- changeLevelCommands playerId howMuch players =
--     let
--         cmdForPlayer existingPlayer =
--             if existingPlayer.id == playerId then
--                 save { existingPlayer | level = existingPlayer.level + howMuch }
--             else
--                 Cmd.none
--     in
--         List.map cmdForPlayer players


-- updatePlayer : Player -> List Player -> List Player
-- updatePlayer updatedPlayer players =
--     let
--         select existingPlayer =
--             if existingPlayer.id == updatedPlayer.id then
--                 updatedPlayer
--             else
--                 existingPlayer
--     in
--         List.map select players


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
  case message of
    ShowLogin ->
      ( model, Navigation.newUrl "#" )

    Username username ->
      ( { model | username = username }
      , Cmd.none
      )

    Password password ->
      ( { model | password = password }
      , Cmd.none
      )

    DoLogin username password ->
      doLogin username password model

    LoginSuccess shows ->
      ( model, Navigation.newUrl "#shows" )

    LoginFailure error ->
      ( model, Cmd.none )
-- update : Msg -> List Player -> ( List Player, Cmd Msg )
-- update message players =
--     case message of
--         FetchAllDone newPlayers ->
--             ( newPlayers, Cmd.none )
--
--         FetchAllFail error ->
--             ( players, Cmd.none )
--
--         ShowPlayers ->
--             ( players, Navigation.newUrl "#players" )
--
--         ShowPlayer id ->
--             ( players, Navigation.newUrl ("#players/" ++ (toString id)) )
--
--         ChangeLevel id howMuch ->
--             ( players, changeLevelCommands id howMuch players |> Cmd.batch )
--
--         SaveSuccess updatedPlayer ->
--             ( updatePlayer updatedPlayer players, Cmd.none )
--
--         SaveFail error ->
--             ( players, Cmd.none )
