module Models exposing (..)

-- import Event.Models exposing (Event)
-- import Episode.Models exposing (Episode)
import Login.Models exposing (User)
import Types exposing (..)
import Messages exposing (Msg(..))
import Routing
import Phoenix.Socket

type alias Model =
  { socket : Phoenix.Socket.Socket Msg
  , user   : User
  , shows  : Shows
  , route  : Routing.Route
  }

websocketUri : String
websocketUri =
  "ws://apitest.impulsedetroit.net/socket/websocket"


initSocket : Phoenix.Socket.Socket Msg
initSocket =
  Phoenix.Socket.init websocketUri
  |> Phoenix.Socket.withDebug


initialModel : Routing.Route -> Model
initialModel route =
  { socket = initSocket
  , user   = User "" ""
  , shows  = []
  , route  = route
  }
