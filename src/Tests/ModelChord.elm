module Tests.ModelChord exposing (chordTest)

import Html exposing (text, div, br)

import Model.Chord as Chord
import Model.Pitch exposing(fromString_)

chordTest =
  let
    string1 = fromString_ "E4"
    string2 = fromString_ "B3"
    string3 = fromString_ "G3"
    string4 = fromString_ "D3"
    string5 = fromString_ "A2"
    string6 = fromString_ "E2"
    case1 = Basics.toString <| Chord.newChord Chord.chordRange
    case2 =
      let
        res =
          Result.andThen (Chord.changeNote 0 "E4")
          <| Result.andThen (Chord.changeNote 1 "B3")
          <| Result.andThen (Chord.changeNote 2 "G3")
          <| Result.andThen (Chord.changeNote 3 "D3")
          <| Result.andThen (Chord.changeNote 4 "A2")
          <| Chord.changeNote 5 "E2"
          <| Chord.newChord Chord.chordRange
      in
        case res of
          Ok ok -> Basics.toString ok
          Err err -> err
    case3 =
      let
        res =
          Result.andThen (Chord.changePick 0 string1 "0")
          <| Result.andThen (Chord.changePick 1 string2 "0")
          <| Result.andThen (Chord.changePick 2 string3 "0")
          <| Result.andThen (Chord.changePick 3 string4 "2")
          <| Result.andThen (Chord.changePick 4 string5 "2")
          <| Chord.changePick 5 string6 "1"
          <| Chord.newChord Chord.chordRange
      in
        case res of
          Ok ok -> Basics.toString ok
          Err err -> err
  in
    div []
      <|  [text case1, br [] [], text case2, br [] [], text case3]
