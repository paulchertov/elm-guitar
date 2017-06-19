module View.View exposing (view)

import Array
import Html.Attributes exposing (id)
import Html exposing (div)

import View.Styles exposing (style_tag)
import View.Bar exposing (mapBar)

view model =
  div
    [id "elm-guitar"]
    <| List.append [style_tag]
    <| Array.toList
    <| Array.indexedMap (mapBar model) model.bars
