module Tests.UtilsCollections exposing (indexInArrayTest)

import Html exposing (text, div)
import Array exposing (Array, fromList, empty)

import Utils.Collections exposing (indexInArray)


{- two positive and two negative tests for different type of args and one with
empty Array-}
indexInArrayTest =
  let
    case1 = Array.fromList [1, 2, 3, 4, 5]
    case2 = Array.fromList ["a", "b", "c"]
    case3 = Array.empty
  in
    div []
      [ indexInArray 2 case1 |> toString |> text
      , indexInArray 7 case1 |> toString |> text
      , indexInArray "c" case2 |> toString |> text
      , indexInArray "k" case2 |> toString |> text
      , indexInArray "k" case3 |> toString |> text
      ]
