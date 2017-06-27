module Update.Update exposing (update)

import Model.Model exposing(Model)
import Update.Msg exposing (Msg(..))
import Update.Selections exposing (setSelectedChord, setSelectedNotePick,
  setSelectedTabPick)

update msg model =
  case msg of
    PickNoteSelected bar chord pick ->
      setSelectedNotePick bar chord pick model
    PickTabSelected bar chord pick ->
      setSelectedTabPick bar chord pick model
    ChordSelected bar chord ->
      setSelectedChord bar chord model
    _ -> model
