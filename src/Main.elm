import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelPick exposing (fromNoteTest)
update msg model =
  model

view model =
  fromNoteTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
