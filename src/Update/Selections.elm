module Update.Selections exposing (setSelectedChord)

import Model.Model exposing (Model, Selection(..))

--change selected chord in model--
--not tested--
setSelectedChord: Int -> Int -> Model -> Model
setSelectedChord bar chord model =
  { model | selection = ChordSelected bar chord }
