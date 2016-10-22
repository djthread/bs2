module Messages exposing (..)

import Login.Messages
import Phoenix.Socket

type Msg
  = PhoenixMsg (Phoenix.Socket.Msg Msg)
  | LoginMsg Login.Messages.Msg

-- import Players.Messages
--
--
-- type Msg
--   = PlayersMsg Players.Messages.Msg
