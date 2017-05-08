import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

update msg model =
  model

view model =
  text "just started"

main =
  beginnerProgram { model = newModel, view = view, update = update }
