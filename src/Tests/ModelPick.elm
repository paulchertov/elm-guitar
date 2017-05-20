module Tests.ModelPick exposing (fromStringTest)

import Html exposing (text, div)

import Model.Pick exposing(Pick, fromString, fromNote, toPluck, toNote)
import Model.Pitch exposing(fromString_)
fromStringTest =
  let
    string1 = Model.Pitch.fromString_ "E4"
    string2 = Model.Pitch.fromString_ "B3"
    case1 = case Model.Pick.fromString "X" string1 of
      Ok pick ->
        (Model.Pick.toPluck string1 pick) == "X"
        |> Basics.toString
      Err err -> err
    case2 = case Model.Pick.fromString "X" string1 of
      Ok pick ->
        (Model.Pick.toNote pick) == "X"
        |> Basics.toString
      Err err -> err
    case3 = case Model.Pick.fromString "x" string2 of
      Ok pick ->
        (Model.Pick.toPluck string2 pick) == "X"
        |> Basics.toString
      Err err -> err
    case4 = case Model.Pick.fromString "x" string2 of
      Ok pick ->
        (Model.Pick.toNote pick) == "X"
        |> Basics.toString
      Err err -> err
    case5 = case Model.Pick.fromString "" string1 of
      Ok pick ->
        (Model.Pick.toPluck string1 pick) == "-"
        |> Basics.toString
      Err err -> err
    case6 = case Model.Pick.fromString "" string1 of
      Ok pick ->
        (Model.Pick.toNote pick) == ""
        |> Basics.toString
      Err err -> err
    case7 = case Model.Pick.fromString "-" string2 of
      Ok pick ->
        (Model.Pick.toPluck string2 pick) == "-"
        |> Basics.toString
      Err err -> err
    case8 = case Model.Pick.fromString "-" string2 of
      Ok pick ->
        (Model.Pick.toNote pick) == ""
        |> Basics.toString
      Err err -> err
    case9 = case Model.Pick.fromString "21" string1 of
      Ok pick -> (Model.Pick.toPluck string1 pick) == "21" |> Basics.toString
      Err err -> "False"
    case10 = case Model.Pick.fromString "21" string1 of
      Ok pick -> (Model.Pick.toNote pick) == "C#6" |> Basics.toString
      Err err -> "False"
    case11 = case Model.Pick.fromString "3" string2 of
      Ok pick -> (Model.Pick.toPluck string2 pick) == "3" |> Basics.toString
      Err err -> "False"
    case12 = case Model.Pick.fromString "3" string2 of
      Ok pick -> (Model.Pick.toNote pick) == "D4"|> Basics.toString
      Err err -> "False"

    case13 = case Model.Pick.fromString "23" string1 of
      Ok pick -> Basics.toString pick
      Err err -> "True"
    case14 = case Model.Pick.fromString "-2" string2 of
      Ok pick -> Basics.toString pick
      Err err -> "True"
  in
    div []
      <| List.map text [case1, case2, case3, case4, case5, case6, case7, case8, case9, case10
      , case11, case12, case13, case14
      ]
