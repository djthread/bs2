module Login.Messages exposing (..)

import Http
import Types exposing (Shows)
import Phoenix.Socket

type Msg
  = ShowLogin
  | Username String
  | Password String
  | DoLogin String String
  | LoginSuccess Shows
  | LoginFailure Http.Error
  | PhoenixMsg (Phoenix.Socket.Msg Msg)
