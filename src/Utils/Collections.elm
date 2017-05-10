module Utils.Collections exposing(indexInArray)

import Array exposing (Array, toList)

--works like js indexOf - returns index of first occurence of item in Array
--tested--
indexInArray: a -> Array a -> Maybe Int
indexInArray needle haystack =
  let
    indexOf: Int -> a -> List a -> Maybe Int
    indexOf index needle haystack =
      case List.head haystack of
        Nothing -> Nothing
        Just head -> if head == needle then
          Just index
          else case List.tail haystack of
            Nothing -> Nothing
            Just tail -> indexOf (index+1) needle tail
  in
    indexOf 0 needle <| Array.toList haystack
