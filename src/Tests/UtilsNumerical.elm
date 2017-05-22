module Tests.UtilsNumerical exposing (maxPowerOfTwoTest)

import Html exposing (text, div, br)

import Utils.Numerical exposing (maxPowerOfTwo)


maxPowerOfTwoTest =
  div []
    <| List.map text
    <| List.map toString
    <| [ maxPowerOfTwo -1 == 0
       , maxPowerOfTwo 10 == 3
       , maxPowerOfTwo 8 == 3
       , maxPowerOfTwo 16 == 4
       , maxPowerOfTwo 0 == 0
       , maxPowerOfTwo 20 == 4
       ]
