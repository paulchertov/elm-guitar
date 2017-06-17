module View.Bar exposing (mapBar)

import Array exposing (Array)
import Html exposing (text, div)
import Html.Attributes exposing (class)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, Selection(..))
import Model.Bar exposing (Bar)

--type for currying settings to bar mapper--
type alias BarSettings =
  { selectedChord: Maybe Int
  , selectedPick: Maybe Int
  , tuning: Array Int
  }

--renders bar as tab (strings with plucks)--
--dummy, not implemented chords mapping--
tabBar: Int -> BarSettings -> Bar -> Html.Html Msg
tabBar index settings bar =
  let
    txt = toString { index = index
    , chord = settings.selectedChord
    , pick = settings.selectedPick
    , tuning = settings.tuning
    , bar = bar
    }
  in
    div [class "tab-bar"] [text txt]

--renders bar as notes--
--dummy, not implemented chords mapping--
noteBar: Int -> BarSettings -> Bar -> Html.Html Msg
noteBar index settings bar =
  let
    txt = toString { index = index
    , chord = settings.selectedChord
    , pick = settings.selectedPick
    , tuning = settings.tuning
    , bar = bar
    }
  in
    div [class "note-bar"] [text txt]

--Function for rendering one Bar--
--not tested--
mapBar: Model -> Int -> Bar -> Html.Html Msg
mapBar model =
  \index -> \bar ->
    let
      (tabSelectedChord, tabSelectedPick) =
        case model.selection of
          TabBarSelected bar chord pick ->
            if bar == index then
              (Just chord, Just pick)
            else (Nothing, Nothing)
          ChordSelected bar chord ->
            if bar == index then
              (Just chord, Nothing)
            else (Nothing, Nothing)
          _ -> (Nothing, Nothing)
      (noteSelectedChord, noteSelectedPick) =
        case model.selection of
          NoteBarSelected bar chord pick ->
            if bar == index then
              (Just chord, Just pick)
            else (Nothing, Nothing)
          _ -> (Nothing, Nothing)
      tabSettings =
        { selectedChord = tabSelectedChord
        , selectedPick = tabSelectedPick
        , tuning = model.tuning
        }
      noteSettings =
        { selectedChord = noteSelectedChord
        , selectedPick = noteSelectedPick
        , tuning = model.tuning
        }
    in
      div
        [ class "bar" ]
        [ text bar.comment
        , tabBar index tabSettings bar
        , noteBar index noteSettings bar
        ]
