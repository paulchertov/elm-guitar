module Update.Msg exposing (Msg(..))

type Msg =
  ChordSelected Int Int
  | PickNoteSelected Int Int Int
  | PickTabSelected Int Int Int
  | PickNoteChanged Int Int Int String
  | PickPluckChanged Int Int Int String
