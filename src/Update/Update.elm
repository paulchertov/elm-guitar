module Update.Update exposing (update)

import Model.Model exposing(Model)
import Update.Msg exposing (Msg(..))
import Update.Selections exposing (setSelectedChord)

update msg model =
  case msg of
    ChordSelected bar chord ->
      setSelectedChord bar chord model
    _ -> model
