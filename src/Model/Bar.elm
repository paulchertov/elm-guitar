module Model.Bar exposing (Bar, length, space, addChord, changeChordDuration)

import Array exposing (Array)

import Model.Chord as Chord
import Utils.Numerical exposing (maxPowerOfTwo)

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
            bar.chords
            |> Array.set
              ((Array.length bar.chords) - 1)
              {last | duration = last.duration // 2}
            |> Array.push
              (Chord.newChord (last.duration // 2))
          else
            if last.duration <= maxVal then
              Array.push (Chord.newChord last.duration) bar.chords
            else
              Array.push (Chord.newChord maxVal) bar.chords
  in
    { bar | chords = chords }

--returns last Chord in Bar--
--not tested--
lastChord: Bar -> Maybe Chord.Chord
lastChord bar =
  Array.get
   ((Array.length bar.chords) - 1)
   bar.chords

--modify duration of Chord in Bar--
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
