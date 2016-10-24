module Types exposing (..)

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

