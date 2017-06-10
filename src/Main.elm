import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.UtilsNumerical exposing (isPowerOfTwoTest)
update msg model =
  model

view model =
  isPowerOfTwoTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
