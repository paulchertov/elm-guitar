module View.Pick exposing (mapPick)

import Array exposing (Array)
import Html exposing (input, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Utils.Collections exposing (defaultGetFromArray)
import Model.Pick exposing (Pick, toPluck, toNote)
import Update.Msg exposing (Msg(..))
import View.Events exposing (onChange)
import View.Common exposing (BarView(..))

type alias ChordSettings =
  { bar: Int
  , chord: Int
  , selected: Maybe Int
  , how: BarView
  , tuning: Array Int
  }

mapPick: ChordSettings -> Int -> Pick -> Html.Html Msg
mapPick settings =
  \index -> \pick ->
    let
      selected = case settings.selected of
        Just selectedIndex -> index == selectedIndex
        Nothing -> False
      tag = if selected then input else span
      event =
        if selected then
          case settings.how of
            Tab ->
              onChange <| PickPluckChanged settings.bar settings.chord index
            Note ->
              onChange <| PickNoteChanged settings.bar settings.chord index
          else
            case settings.how of
              Tab ->
                onClick <| PickTabSelected settings.bar settings.chord index
              Note ->
                onClick <| PickNoteSelected settings.bar settings.chord index
      content = case settings.how of
        Tab -> toPluck (defaultGetFromArray index 0 settings.tuning) pick
        Note -> toNote pick
    in
      tag [class "string", event] [text content]
