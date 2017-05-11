module Model.Pitch exposing (notes, fretsCount, tunings, pickAt, frequency,
 toString, fromString)

import Array exposing (Array, fromList, get)
import Dict exposing (get, fromList)

import Utils.Collections exposing (indexInArray)

{-Agreements:
pitch: steps from C0
note: steps from the beginning of octave, or its string representation
pluck: fret where string must be plucked to play note with provided pitch
string: pitch of string's tunning
-}

--Constants--
notes: Array String
notes =
  Array.fromList
  <| ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

--number of frets on the neck
fretsCount: Int
fretsCount = 22

--available guitar tunings--
tunings =
  Dict.fromList [
    ("EBGDAE", --standard tuning
      Array.fromList
        [ fromString "E4"
        , fromString "B3"
        , fromString "G3"
        , fromString "D3"
        , fromString "A2"
        , fromString "E2"]
    )
  ]

{-fret number on string where note can be plucked
arguments:
 string - tuning of string,
 pluck - fret where string was plucked-}
--not tested--
pickAt: Int -> Int -> Maybe Int
pickAt string pitch =
  let
    pluck = pitch - string
  in
    if pluck < 0 || pluck > fretsCount then Nothing else Just pluck

--find frequency of pluck's note tuned from A4 (440Hz)--
--tested--
frequency: Int -> Float
frequency pitch =
  let
    adjust = pitch - (12*4 + 9) |> toFloat
  in
    440.0 * 2.0^(adjust/12.0)

--return string representation of note with provided pitch--
--tested--
toString: Int -> String
toString pitch =
  let
    octave = pitch // 12 |> Basics.toString
    note = Array.get (pitch % 12) notes
  in
    case note of
      Just note -> note ++ octave
      Nothing -> "Corrupted note"

--return pitch of note from note's string representation--
--tested--
fromString: String -> Result String Int
fromString input =
  let
    note =
      if String.contains "#" input then
        String.left 2 input
      else
        String.left 1 input
    octave =
      String.right 1 input |> String.toInt
  in
    case indexInArray note notes of
      Nothing -> Err "No such note"
      Just pitch ->
        case octave of
          Ok octave -> Ok (12*octave + pitch)
          Err error -> Err "No octave"
