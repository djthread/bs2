module Messages exposing (..)

import Login.Messages
import Phoenix.Socket

type Msg
  = LoginMsg Login.Messages.Msg

-- import Players.Messages
--
--
-- type Msg
--   = PlayersMsg Players.Messages.Msg
