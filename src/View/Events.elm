module View.Events exposing (onChange, onClickPreventDefault)

import Html exposing (Attribute)
import Html.Attributes exposing (attribute)
import Html.Events exposing (on, targetValue)
import Json.Decode exposing (map)

onChange: (String -> msg) -> Attribute msg
onChange message =
  on "change" (Json.Decode.map message targetValue)

onClickPreventDefault: Attribute msg
onClickPreventDefault =
  attribute "onclick" "event.preventDefault(); event.stopImmediatePropagation();"
