module Chord exposing (Chord, newChord, changePick, changeNote)

import Array exposing (Array, repeat, get, set)
import Pick exposing (Pick, fromString, fromNote)

--type for 1 Chord (notes picked simulaneously)--
type alias Chord =
  { picks: Array Pick
  , duration: Int
  }

--creating new Chord containing 6 empty picks--
--not tested--
newChord: Int -> Chord
newChord duration =
  { picks = Array.repeat 6 EmptyPick
  , duration = duration
  }

--update Pick in chord from its pluck representation--
--not tested--
changePick: Int -> String -> Chord -> Result String Chord
changePick string input chord =
  case Pick.fromString input of
    Ok ok -> {chord | picks = Array.set string ok chord.picks}
    Err err -> Err err

--update Pick in chord from its note representation--
--not tested--
changeNote: Int -> String -> Chord -> Result String Chord
changeNote string input chord =
  case Pick.fromNote input of
    Ok ok -> {chord | picks = Array.set string ok chord.picks}
    Err err -> Err err
