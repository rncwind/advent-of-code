module Main (main) where

import Data.Char
import Data.List (intersect)
import Data.List.Split

main :: IO ()
main = do
  content <- readFile "input.txt"
  let lns = lines content
  let compartments = map splitHalf lns
  let prios = priorityIntersections compartments
  print prios
  print (sum prios)

  let part2 = chunksOf 3 lns
  let badgeOrdinals = badges part2
  print badgeOrdinals
  print (sum badgeOrdinals)
  print "Done"

priorityIntersections :: [([Char], [Char])] -> [Int]
priorityIntersections [] = []
priorityIntersections (x : xs) =
  priorityIntersections xs ++ [toOrdinal (head (fst x `intersect` snd x))]

badges :: Foldable t => [t [Char]] -> [Int]
badges [] = []
badges (x : xs) =
  badges xs ++ [toOrdinal (head (foldl1 intersect x))]

toOrdinal :: Char -> Int
toOrdinal c =
  if isUpper c
    then ord c - 38
    else ord c - 96

splitHalf :: [a] -> ([a], [a])
splitHalf l =
  splitAt ((length l + 1) `div` 2) l
