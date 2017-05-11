module Tests.ModelPitch exposing (stringTest)

import Html exposing (text, div)

import Model.Pitch exposing(notes, fretsCount, tunings, pickAt, frequency,
 toString, fromString)

stringTest =
  let
    case1 =
      case Model.Pitch.fromString "A4" of
        Ok ok -> ok
        Err err -> -1
    case2 =
      case Model.Pitch.fromString "C0" of
        Ok ok -> ok
        Err err -> -1
    case3 =
      case Model.Pitch.fromString "X" of
        Ok ok -> ok
        Err err -> -1
    case4 = 12*4 + 9
    case5 = 0

  in
    div []
      [ (Model.Pitch.toString case1) == "A4" |> Basics.toString |> text
      , case1 == (12*4 + 9) |> Basics.toString |> text
      , (Model.Pitch.toString case2) == "C0" |> Basics.toString |> text
      , case2 == 0 |> Basics.toString |> text
      , case3 == -1 |> Basics.toString |> text
      , (Model.Pitch.toString case4) == "A4" |> Basics.toString |> text
      , (Model.Pitch.toString case5) == "C0" |> Basics.toString |> text
      ]
