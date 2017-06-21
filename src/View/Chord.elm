module View.Chord exposing (mapChord)

import Array exposing (Array)
import Html exposing (div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Model.Chord exposing (Chord)
import Update.Msg exposing (Msg(..))
import View.Common exposing (BarView(..))

type alias BarSettings =
  { how: BarView
  , barIndex: Int
  , selectedChord: Maybe Int
  , selectedPick: Maybe Int
  , tuning: Array Int
  }

--Function for rendering one Chord--
--dummy--
mapChord: BarSettings -> Int -> Chord -> Html.Html Msg
mapChord settings =
  \index -> \chord ->
    let
      tagClass = case settings.selectedChord of
        Just selectedIndex ->
          if selectedIndex == index then
            class "chord active"
          else class "chord"
        Nothing -> class "chord"
      attrs =
        [ tagClass
        , onClick <| ChordSelected settings.barIndex index
        ]
    in
      div attrs [text <| Basics.toString chord.picks]
