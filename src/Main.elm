import Html exposing (beginnerProgram, text)

--import Update.Msg exposing (Msg)
--import Model.Model exposing (Model, newModel)

import Tests.ViewEvents exposing (eventTest, update, newModel)

view model =
  eventTest model

main =
  beginnerProgram { model = newModel, view = view, update = update }
