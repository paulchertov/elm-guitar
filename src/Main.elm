import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.UtilsCollections exposing (splitArrayAtTest)
update msg model =
  model

view model =
  splitArrayAtTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
