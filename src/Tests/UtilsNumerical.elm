module Tests.UtilsNumerical exposing (maxPowerOfTwoTest, isPowerOfTwoTest)

import Html exposing (text, div, br)

import Utils.Numerical exposing (maxPowerOfTwo, isPowerOfTwo)


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


isPowerOfTwoTest =
  div []
    <| List.map text
    <| List.map toString
    <| [ isPowerOfTwo 1
       , isPowerOfTwo 2
       , not <| isPowerOfTwo 3
       , isPowerOfTwo 4
       , not <| isPowerOfTwo 6
       , not <| isPowerOfTwo 7
       , isPowerOfTwo 8
       , not <| isPowerOfTwo 9
       , not <| isPowerOfTwo 0
       , not <| isPowerOfTwo -8
       ]
