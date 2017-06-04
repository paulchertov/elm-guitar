module Utils.Collections exposing(indexInArray,
  splitArrayAt, removeArrayItemAt, insertArrayItemAt)

import Array exposing (Array, toList)
import Tuple

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

{-returns two parts of array in Tuple: first one - all items with index
less than provided value, second - with index higher than or equal to that
value
-}
--tested--
splitArrayAt: Int -> Array a -> (Array a, Array a)
splitArrayAt at array =
  ( Array.slice 0 at array
  , Array.slice at (Array.length array) array
  )

--removes item with target index in array--
--tested--
removeArrayItemAt: Int -> Array a -> Array a
removeArrayItemAt at array =
  Array.append
    (Array.slice 0 at array)
    (Array.slice (at+1) (Array.length array) array)

--insert item in array at target index--
--tested--
insertArrayItemAt: Int -> a -> Array a -> Array a
insertArrayItemAt at item array =
  Array.append (Array.slice 0 at array)
  <| Array.append (Array.fromList [item])
  <| Array.slice (at+1) (Array.length array) array
