module Login.Messages exposing (..)

import Http
import Models exposing (Shows)

type Msg
  = ShowLogin
  | SetUsername String
  | SetPassword String
  | DoLogin String String
  | LoginSuccess Shows
  | LoginFailure Http.Error
