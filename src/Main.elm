import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.UtilsCollections exposing (removeArrayAtTest)
update msg model =
  model

view model =
  removeArrayAtTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
