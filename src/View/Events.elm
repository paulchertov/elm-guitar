module View.Events exposing (onChange)

import Html exposing (Attribute)
import Html.Events exposing (on, targetValue)
import Json.Decode exposing (map)

onChange: (String -> msg) -> Attribute msg
onChange message =
  on "change" (Json.Decode.map message targetValue)
