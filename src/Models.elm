module Models exposing (..)

-- import Event.Models exposing (Event)
-- import Episode.Models exposing (Episode)
-- import Login.Models exposing (User)
import Messages exposing (Msg(..))
import Routing

apiUrl =
  "http://localhost:4091/api"

type alias Config =
  { apiUrl : String
  }

type alias Model =
  { user   : User
  , shows  : Shows
  , route  : Routing.Route
  , config : Config
  }

type alias User =
  { username : String
  , password : String
  }

type alias ShowSlug =
  String

type alias Show =
  { id         : Int
  , name       : String
  , slug       : ShowSlug
  , tiny_info  : String
  , short_info : String
  , full_info  : String
  -- , episodes   : List Episode
  -- , events     : List Event
  }

type alias Shows =
  List Show

-- websocketUri : String
-- websocketUri =
--   "ws://apitest.impulsedetroit.net/socket/websocket"


-- initSocket : Phoenix.Socket.Socket Msg
-- initSocket =
--   Phoenix.Socket.init websocketUri
--   |> Phoenix.Socket.withDebug


initialModel : Routing.Route -> Model
initialModel route =
  { user   = User "" ""
  , shows  = []
  , route  = route
  , config = Config apiUrl
  }

