module Tests.ModelBar exposing (barTest)

import Html exposing (text, div, br)
import Array

import Model.Bar as Bar
import Model.Chord as Chord
import Model.Pitch exposing(fromString_)

string1 = fromString_ "E4"
string2 = fromString_ "B3"
string3 = fromString_ "G3"
string4 = fromString_ "D3"
string5 = fromString_ "A2"
string6 = fromString_ "E2"




barTest =
  let
    emptyBar = Bar.newBar
    barWithPluck = case Bar.changePick 0 0 string1 "3" emptyBar of
      Ok ok -> ok
      Err _ -> emptyBar
    twoChordBar =
      case Bar.changePick 1 1 string2 "7" (Bar.addChord barWithPluck) of
        Ok ok -> ok
        Err _ -> emptyBar
    threeChordBar =
        case Bar.changeNote 2 1 "B3" (Bar.addChord twoChordBar) of
          Ok ok -> ok
          Err _ -> emptyBar

    deletedEmpty =
      case Bar.insertChord 0 (Chord.newChord 256) <| Bar.deleteChord 0 barWithPluck of
        Ok chord -> chord
        Err _ -> threeChordBar
    deletedWithPluck =
      case Bar.changeChordDuration 256 0 <| Bar.deleteChord 1 twoChordBar of
        Just bar -> bar
        Nothing -> emptyBar
    deletedTwoChord =
      case Bar.changeChordDuration 128 1 <| Bar.deleteChord 2 threeChordBar of
        Just bar -> bar
        Nothing -> emptyBar
  in
    div []
     <| List.map text
     <| List.map Basics.toString
     [ emptyBar == deletedEmpty
     , barWithPluck == deletedWithPluck
     , twoChordBar == deletedTwoChord
     ]
