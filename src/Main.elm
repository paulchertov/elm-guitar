import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelChord exposing (chordTest)
update msg model =
  model

view model =
  chordTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
