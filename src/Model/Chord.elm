module Model.Chord exposing (Chord, chordRange, newChord, changePick, changeNote)

import Array exposing (Array, repeat, get, set)

import Model.Pick as Pick

--type for 1 Chord (notes picked simulaneously)--
type alias Chord =
  { picks: Array Pick.Pick
  , duration: Int
  }

--CONSTANTS--
--minimal duration of the chord as denominator ex 1/256
chordRange: Int
chordRange = 256

--creating new Chord containing 6 empty picks--
--not tested--
newChord: Int -> Chord
newChord duration =
  { picks = Array.repeat 6 Pick.EmptyPick
  , duration = duration
  }

--update Pick in chord from its pluck representation--
--not tested--
changePick: Int -> Int -> String -> Chord -> Result String Chord
changePick stringIndex stringPitch input chord =
  case Pick.fromString input stringPitch of
    Ok ok -> Ok {chord | picks = Array.set stringIndex ok chord.picks}
    Err err -> Err err

--update Pick in chord from its note representation--
--not tested--
changeNote: Int -> String -> Chord -> Result String Chord
changeNote stringIndex input chord =
  case Pick.fromNote input of
    Ok ok -> Ok {chord | picks = Array.set stringIndex ok chord.picks}
    Err err -> Err err
