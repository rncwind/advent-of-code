module Main where

import Data.List
import Data.List.Split
import Data.Ord

main :: IO ()
main = do
  content <- readFile "input.txt"
  -- Split each line into it's own value.
  let lns = lines content
  -- Split each "run" of numbers into a sub-list.
  let split = splitOn [""] lns
  let parsed = parseElf split
  -- print (length parsed)
  let caltot = calorieCounts parsed
  -- print caltot
  -- print (maximum caltot)
  let fattestThree = partTwoSorter caltot
  print fattestThree
  let fattestThreeTotal = sum fattestThree
  print fattestThreeTotal

-- print calSums

parseElf :: [[String]] -> [[Int]]
parseElf [] = []
parseElf (x : xs) =
  parseElf xs ++ [map (read :: String -> Int) x]

calorieCounts :: [[Int]] -> [Int]
calorieCounts [] = []
calorieCounts (x : xs) =
  calorieCounts xs ++ [sum x]

fatElfFinder xs =
  head $ filter ((== maximum xs) . (xs !!)) [0 ..]

partTwoSorter xs =
  take 3 (sortDesc xs)

sortDesc =
  sortOn negate
