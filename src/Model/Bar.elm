module Model.Bar exposing (Bar, newBar, length, space, repr,
  addChord, changeChordDuration,
  changePick, changeNote)

import Array exposing (Array)
import Html exposing (text, div, br)

import Model.Chord as Chord
import Utils.Numerical exposing (maxPowerOfTwo)
import Utils.Collections exposing (removeArrayItemAt, insertArrayItemAt)

--type for one bar--
type alias Bar =
  { chords: Array Chord.Chord
  , comment: String
  }

--creating new Bar with one empty chord whole bar length--
--not tested--
newBar: Bar
newBar = Bar (Array.fromList [Chord.newChord Chord.chordRange]) ""

--determine what part of bar used--
--not tested--
length: Bar -> Int
length bar =
  let
    measure: Chord.Chord -> Int -> Int
    measure chord memo = memo + chord.duration
  in
    Array.foldl measure 0 bar.chords

--determine how much space available in bar--
--not tested--
space: Bar -> Int
space bar = Chord.chordRange - length bar

--Html representation of Bar for debugging purpouses--
--not tested--
repr: Bar -> Html.Html msg
repr bar =
  let
    mapChord =
      \chord ->
        div [] [text (Basics.toString chord)]
  in
    div []
      (
        [ text "[[Bar{"
        , text "comment: "
        , text bar.comment
        , text ";space: "
        , text <| Basics.toString <| space bar
        , text ";length: "
        , text <| Basics.toString <| length bar
        , text ";chords: "
        , br [] []
        ] ++
        (Array.toList <| Array.map mapChord bar.chords)
        ++
        [ text "}]]"
        , br [] []
        ]
      )


--add chord to Bar--
--not tested--
addChord: Bar -> Bar
addChord bar =
  let
    maxVal = case space bar |> maxPowerOfTwo of
      Nothing -> 0
      Just val -> 2^val
    chords =
      case lastChord bar of
        Nothing ->
          Array.push (Chord.newChord Chord.chordRange) bar.chords
        Just last ->
          if maxVal == 0 then
            if last.duration > 1 then
              bar.chords
              |> Array.set
                ((Array.length bar.chords) - 1)
                {last | duration = last.duration // 2}
              |> Array.push
                (Chord.newChord (last.duration // 2))
            else
              bar.chords
          else
            if last.duration <= maxVal then
              Array.push (Chord.newChord last.duration) bar.chords
            else
              Array.push (Chord.newChord maxVal) bar.chords
  in
    { bar | chords = chords }

--deletes Chord with target index from Bar--
--not tested--
deleteChord: Int -> Bar -> Bar
deleteChord at bar =
  { bar | chords = removeArrayItemAt  at bar.chords }

--insert Chord to target position at Bar--
--not tested--
insertChord: Int -> Chord.Chord -> Bar -> Bar
insertChord at chord bar =
  { bar | chords = insertArrayItemAt at chord bar.chords }

--returns last Chord in Bar--
--not tested--
lastChord: Bar -> Maybe Chord.Chord
lastChord bar =
  Array.get
   ((Array.length bar.chords) - 1)
   bar.chords

--modify duration of Chord in Bar--
--TODO: add power of two check--
--not tested--
changeChordDuration: Int -> Int -> Bar -> Maybe Bar
changeChordDuration duration chordIndex bar =
  case Array.get chordIndex bar.chords of
    Nothing -> Nothing
    Just chord ->
      let
        newDuration = (length bar) - chord.duration + duration
      in
        if newDuration > Chord.chordRange then
          Nothing
        else
          Just { bar | chords =
            Array.set chordIndex { chord | duration = newDuration } bar.chords
          }

{-changes pick in target chord on target string in this bar
pick described with its pluck representation -}
--not tested
changePick: Int -> Int -> Int -> String -> Bar -> Result String Bar
changePick chordIndex stringIndex stringPitch input bar =
  case Array.get chordIndex bar.chords of
    Nothing -> Err "Cannot find chord with this index"
    Just chord ->
      case Chord.changePick stringIndex stringPitch input chord of
        Ok ok -> Ok {bar | chords = Array.set chordIndex ok bar.chords}
        Err err -> Err err

{-changes pick in target chord on target string in this bar
pick described with its note representation-}
--not tested
changeNote: Int -> Int -> String -> Bar -> Result String Bar
changeNote chordIndex stringIndex input bar =
  case Array.get chordIndex bar.chords of
    Nothing -> Err "Cannot find chord with this index"
    Just chord ->
      case Chord.changeNote stringIndex input chord of
        Ok ok -> Ok {bar | chords = Array.set chordIndex ok bar.chords}
        Err err -> Err err
