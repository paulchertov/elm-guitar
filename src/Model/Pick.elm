module Model.Pick exposing (Pick, fromString, fromNote)

import Model.Pitch exposing (fromString, frequency)

--Type for 1 pick - one pluck on guitar string--
type Pick =
    EmptyPick
    | SimplePick Int
    | XPick

{-create Pick from number of fret where string was plucked (or X)
 and string tuning-}
--not tested--
fromString: String -> Int -> Result String Pick
fromString input string =
  let
    at = String.toInt input
  in
    case at of
      Err err -> Err "wrong symbol"
      Ok at ->
        if input == "X" || input == "x" then
          Ok XPick
        else if input == "" || input == "-" then
          Ok EmptyPick
        else if at >= 0 || at <= fretsCount then
          Ok <| Pick <| string + at
        else
          Err "Trying to pick outside of fret"

--create Pick from note and octave string representation ex C#3
--not tested--
fromNote: String -> Result String Pick
fromNote input
  if input == "" then
    Ok EmptyPick
  else
    case Pitch.fromString input of
      Ok pitch -> SimplePick pitch
      Err err -> Err err

--string representation of Pick on tab bar
--not tested--
toPluck: Int -> Pick -> String
toPluck string pick =
  case pick of
    EmptyPick -> "-"
    XPick -> "X"
    SimplePick pitch ->
      case Pitch.pickAt string pitch of
        Ok ok -> Basics.toString ok
        Err err -> err --impossible option

--string representation of Pick on text note bar
--not tested--
toNote: Pick -> String
toNote pick =
  case pick of
    EmptyPick -> ""
    XPick -> "X"
  SimplePick pitch -> Pitch.toString pitch
