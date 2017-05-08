module Model.Model exposing (Model, Selection, newModel)

import Array exposing (Array, empty)

type Selection =
  NothingSelected
  | NoteBarSelected Int Int Int
  | TabBarSelected Int Int Int
  | ChordSelected Int Int

type alias Model =
  { bars: Array Bar
  , tuning: Array Int
  , error: String
  , playing: Bool
  , selection: Selection
  }

--TODO: move to src\model\Bar.elm
type alias Bar =
  { chords: Array Chord
  , comment: String
  }

--TODO: move to src\model\Chord.elm
type alias Chord =
  { picks: Array Pick
  , duration: Int
  }

--TODO: move to src\model\Pick.elm
type Pick =
    EmptyPick
    | SimplePick Int
    | XPluck

--TODO: replace stub with actual method
newModel =
    { bars = Array.empty
    , tuning = Array.empty
    , error = ""
    , playing = False
    , selection = NothingSelected
    }
