module Login.Update exposing (..)

import Login.Models exposing (User)
import Types exposing (Shows)
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


update : Msg -> User -> ( User, Cmd Msg )
update message user =
  case message of
    ShowLogin ->
      ( user, Navigation.newUrl "#" )

    Username username ->
      ( { user | username = username }
      , Cmd.none
      )

    Password password ->
      ( { user | password = password }
      , Cmd.none
      )

    DoLogin username password ->
      doLogin username password user

    LoginSuccess shows ->
      ( user, Navigation.newUrl "#shows" )

    LoginFailure error ->
      ( user, Cmd.none )
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
