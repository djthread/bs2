module Login.Messages exposing (..)

import Http
import Types exposing (Shows)

type Msg
  = ShowLogin
  | DoLogin String String
  | LoginSuccess Shows
  | LoginFailure Http.Error
