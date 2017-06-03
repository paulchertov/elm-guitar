module Tests.UtilsCollections exposing (indexInArrayTest,
  splitArrayAtTest)

import Html exposing (text, div)
import Array exposing (Array, fromList, empty)

import Utils.Collections exposing(indexInArray,
  splitArrayAt, removeArrayItemAt, insertArrayItemAt)

sequential = Array.fromList [1, 2, 3, 4, 5]
alphabetic = Array.fromList ["a", "b", "c"]
empty = Array.empty

{- two positive and two negative tests for different type of args and one with
empty Array-}
indexInArrayTest =
  div []
    [ indexInArray 2 sequential |> toString |> text
    , indexInArray 7 sequential |> toString |> text
    , indexInArray "c" alphabetic |> toString |> text
    , indexInArray "k" alphabetic |> toString |> text
    , indexInArray "k" empty |> toString |> text
    ]

splitArrayAtTest =
  let
    case1 = splitArrayAt 3 sequential
    case2 = splitArrayAt 10 sequential
    case3 = splitArrayAt -3 sequential
  in
    div []
      [ case1 |> toString |> text
      , case2 |> toString |> text
      , case3 |> toString |> text
      ]
