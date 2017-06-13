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

    firstChordFull =
      case Chord.newChord 256 |> Chord.changePick 0 string1 "3" of
        Ok chord -> chord
        Err _ -> Chord.newChord 256
    firstChordHalf =
      case Chord.newChord 128 |> Chord.changePick 0 string1 "3" of
        Ok chord -> chord
        Err _ -> Chord.newChord 256
    secondChordHalf =
      case Chord.newChord 128 |> Chord.changePick 1 string2 "7" of
        Ok chord -> chord
        Err _ -> Chord.newChord 128
    secondChordQuarter =
      case Chord.newChord 64 |> Chord.changePick 1 string2 "7" of
        Ok chord -> chord
        Err _ -> Chord.newChord 128
    thirdChord =
      case Chord.newChord 64 |> Chord.changeNote 2 "B3" of
        Ok chord -> chord
        Err _ -> Chord.newChord 64

    adjustedWithPluck =
      case Bar.insertChord 0 firstChordFull <| Bar.deleteChord 0 emptyBar of
        Ok bar -> bar
        Err _ -> emptyBar
    adjustedTwoChord =
      case
        Result.andThen (Bar.insertChord 1 secondChordHalf)
        <| Bar.insertChord 0 firstChordHalf
        <| Bar.deleteChord 0 emptyBar
      of
        Ok bar -> bar
        Err _ -> emptyBar
    adjustedThreeChord =
      case
        Result.andThen (Bar.insertChord 2 thirdChord)
        <| Result.andThen (Bar.insertChord 1 secondChordQuarter)
        <| Bar.insertChord 0 firstChordHalf
        <| Bar.deleteChord 0 emptyBar
      of
        Ok bar -> bar
        Err _ -> emptyBar

    deletedEmpty =
      case Bar.insertChord 0 (Chord.newChord 256) <| Bar.deleteChord 0 barWithPluck of
        Ok bar -> bar
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
     [ barWithPluck == adjustedWithPluck
     , twoChordBar == adjustedTwoChord
     , threeChordBar == adjustedThreeChord
     , emptyBar == deletedEmpty
     , barWithPluck == deletedWithPluck
     , twoChordBar == deletedTwoChord
     ]
