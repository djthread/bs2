module Login.Commands exposing (..)

-- import Http
-- import Json.Decode as JD exposing ((:=))
import Json.Encode as JE
-- import Task
-- import Players.Models exposing (PlayerId, Player)
-- import Players.Messages exposing (..)
import Models exposing (Model)
-- import Messages
import Login.Messages exposing (Msg(..))
import Phoenix.Socket
import Phoenix.Channel


doLogin : String -> String -> Model -> ( Model, Cmd Msg )
doLogin user pass model =
  let
    params =
      JE.object
        [ ("user", JE.string user)
        , ("pass", JE.string pass)
        ]
    channel =
      Phoenix.Channel.init "admin"
      |> Phoenix.Channel.withPayload params
    (phxSocket, phxCmd) =
      Phoenix.Socket.join channel model.socket
  in
    ( { model | socket = phxSocket }
    , Cmd.map PhoenixMsg phxCmd
    )

--
-- fetchAll : Cmd Msg
-- fetchAll =
--     Http.get collectionDecoder fetchAllUrl
--         |> Task.perform FetchAllFail FetchAllDone
--
--
-- fetchAllUrl : String
-- fetchAllUrl =
--     "http://localhost:4000/players"
--
--
-- saveUrl : PlayerId -> String
-- saveUrl playerId =
--     "http://localhost:4000/players/" ++ (toString playerId)
--
--
-- saveTask : Player -> Task.Task Http.Error Player
-- saveTask player =
--     let
--         body =
--             memberEncoded player
--                 |> Encode.encode 0
--                 |> Http.string
--
--         config =
--             { verb = "PATCH"
--             , headers = [ ( "Content-Type", "application/json" ) ]
--             , url = saveUrl player.id
--             , body = body
--             }
--     in
--         Http.send Http.defaultSettings config
--             |> Http.fromJson memberDecoder
--
--
-- save : Player -> Cmd Msg
-- save player =
--     saveTask player
--         |> Task.perform SaveFail SaveSuccess
--
--
--
-- -- DECODERS
--
--
-- collectionDecoder : Decode.Decoder (List Player)
-- collectionDecoder =
--     Decode.list memberDecoder
--
--
-- memberDecoder : Decode.Decoder Player
-- memberDecoder =
--     Decode.object3 Player
--         ("id" := Decode.int)
--         ("name" := Decode.string)
--         ("level" := Decode.int)
--
--
-- memberEncoded : Player -> Encode.Value
-- memberEncoded player =
--     let
--         list =
--             [ ( "id", Encode.int player.id )
--             , ( "name", Encode.string player.name )
--             , ( "level", Encode.int player.level )
--             ]
--     in
--         list
--             |> Encode.object
