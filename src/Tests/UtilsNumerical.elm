module Tests.UtilsNumerical exposing (maxPowerOfTwoTest)

import Html exposing (text, div, br)

import Utils.Numerical exposing (maxPowerOfTwo)


maxPowerOfTwoTest =
  div []
    <| List.map text
    <| List.map toString
    <| [ maxPowerOfTwo -1 == Nothing
       , maxPowerOfTwo 10 == Just 3
       , maxPowerOfTwo 8 == Just 3
       , maxPowerOfTwo 16 == Just 4
       , maxPowerOfTwo 0 == Nothing
       , maxPowerOfTwo 20 == Just 4
       ]
