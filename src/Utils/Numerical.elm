module Utils.Numerical exposing (maxPowerOfTwo, isPowerOfTwo)

import Bitwise

--infixing Bitwise.and for convinient use--
(&) l r = Bitwise.and l r
infixl 9 &

--returns maximal power of two, for which power of two is less than limit
--tested--
maxPowerOfTwo: Int -> Maybe Int
maxPowerOfTwo limit =
  let
    maxPowerOfTwo_: Int -> Maybe Int
    maxPowerOfTwo_ current =
      if 2^current > limit then Nothing
      else case maxPowerOfTwo_ (current + 1) of
        Nothing -> Just current
        Just val -> Just val
  in
    maxPowerOfTwo_ 1

--returns is value is the power of two--
--not tested--
isPowerOfTwo: Int -> Bool
isPowerOfTwo val = (val /= 0) && ((val & (val - 1)) == 0)
