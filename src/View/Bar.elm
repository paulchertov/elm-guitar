module View.Bar exposing (mapBar)

import Array exposing (Array)
import Html exposing (text, div)
import Html.Attributes exposing (class)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, Selection(..))
import Model.Bar exposing (Bar)

import View.Common exposing (BarView(..))
import View.Chord exposing (mapChord)


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
        { how = Tab
        , barIndex = index
        , selectedChord = tabSelectedChord
        , selectedPick = tabSelectedPick
        , tuning = model.tuning
        }
      noteSettings =
        { how = Note
        , barIndex = index
        , selectedChord = noteSelectedChord
        , selectedPick = noteSelectedPick
        , tuning = model.tuning
        }
    in
      div
        [ class "bar" ]
        [ text bar.comment
        , div [class "tab-bar"]
            <| Array.toList
            <| Array.indexedMap (mapChord tabSettings) bar.chords
        , div [class "note-bar"]
            <| Array.toList
            <| Array.indexedMap (mapChord noteSettings) bar.chords
        ]
