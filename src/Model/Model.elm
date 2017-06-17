module Model.Model exposing (Model, Selection(..), newModel)

import Array exposing (Array, empty)

import Model.Pick exposing (Pick)
import Model.Chord exposing (Chord)
import Model.Bar exposing (Bar)

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

--TODO: replace stub with actual method
newModel =
  { bars = Array.empty
  , tuning = Array.empty
  , error = ""
  , playing = False
  , selection = NothingSelected
  }
