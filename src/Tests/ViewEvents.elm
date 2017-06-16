module Tests.ViewEvents exposing (eventTest, newModel, update)

import Html exposing (text, input, div)

import View.Events exposing (onChange)

type Msg = Changed String
type Model = String
newModel = ""
update (Changed content) formerContent =
  content
eventTest model =
  div []
    [ input [onChange Changed] []
    , div [] [text model]
    ]
