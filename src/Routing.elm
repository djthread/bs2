module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)
-- import Types exposing (ShowSlug)


type Route
  = LoginRoute
  -- | ShowsRoute
  -- | ShowRoute ShowSlug
  -- | EpisodesRoute ShowSlug
  -- | EventsRoute ShowSlug
  -- | InfoRoute ShowSlug
  -- | StreamRoute ShowSlug
  -- | HelpRoute ShowSlug
  | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ format LoginRoute (s "")
    -- , format ShowsRoute (s "shows")
    -- , format ShowRoute (s "shows" </> string)
    -- , format EpisodesRoute (s "shows" </> string </> "episodes")
    -- , format EventsRoute (s "shows" </> string </> "events")
    -- , format InfoRoute (s "shows" </> string </> "info")
    -- , format StreamRoute (s "shows" </> string </> "stream")
    -- , format HelpRoute (s "shows" </> string </> "help")
    ]


hashParser : Navigation.Location -> Result String Route
hashParser location =
  location.hash
  |> String.dropLeft 1
  |> parse identity matchers


parser : Navigation.Parser (Result String Route)
parser =
  Navigation.makeParser hashParser


routeFromResult : Result String Route -> Route
routeFromResult result =
  case result of
    Ok route ->
      route

    Err string ->
      NotFoundRoute
