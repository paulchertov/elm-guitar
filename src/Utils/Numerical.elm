module Utils.Numerical exposing (maxPowerOfTwo)

--returns maximal power of two, for which power of two is less than limit
--not tested--
maxPowerOfTwo: Int -> Int
maxPowerOfTwo limit =
  let
    maxPowerOfTwo_: Int -> Maybe Int
    maxPowerOfTwo_ current =
      if 2^current > limit then Nothing
      else case maxPowerOfTwo_ (current + 1) of
        Nothing -> Just current
        Just val -> Just val
  in
    case maxPowerOfTwo_ 1 of
      Just val -> val
      Nothing -> 0
