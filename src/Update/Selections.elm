module Update.Selections exposing (setSelectedChord, setSelectedNotePick,
  setSelectedTabPick)

import Model.Model exposing (Model, Selection(..))

--change selected chord in model--
--not tested--
setSelectedChord: Int -> Int -> Model -> Model
setSelectedChord bar chord model =
  { model | selection = ChordSelected bar chord }
setSelectedNotePick: Int -> Int -> Int -> Model -> Model
setSelectedNotePick bar chord pick model =
  { model | selection = NotePickSelected bar chord pick}
setSelectedTabPick: Int -> Int -> Int -> Model -> Model
setSelectedTabPick bar chord pick model =
  { model | selection = TabPickSelected bar chord pick}
