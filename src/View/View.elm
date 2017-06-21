module View.View exposing (view)

import Array
import Html.Attributes exposing (id)
import Html exposing (div, text)

import View.Styles exposing (styleTag)
import View.Bar exposing (mapBar)

view model =
  div
    [id "elm-guitar"]
    <| List.append [styleTag]
    <| Array.toList
    <| Array.indexedMap (mapBar model) model.bars
