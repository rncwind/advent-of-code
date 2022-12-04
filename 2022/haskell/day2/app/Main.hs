module Main (main) where

import Data.List.Split

main :: IO ()
main = do
  content <- readFile "input.txt"
  -- Split into lines
  let lns = lines content
  -- Turn each line into a pair.
  let pairedLines = map (splitOn " ") lns
  let scoresPt1 = traverseListPt1 pairedLines
  let totalScorePt1 = sum scoresPt1
  print totalScorePt1

  let scoresPt2 = traverseListPt2 pairedLines
  let totalScorePt2 = sum scoresPt2
  print totalScorePt2

traverseListPt1 :: [[String]] -> [Int]
traverseListPt1 [] = []
traverseListPt1 (x : xs) =
  traverseListPt1 xs ++ [calculateScorePt1 x]

traverseListPt2 :: [[String]] -> [Int]
traverseListPt2 [] = []
traverseListPt2 (x : xs) =
  traverseListPt2 xs ++ [calculateScorePt2 x]

calculateScorePt1 :: [String] -> Int
calculateScorePt1 pair =
  let rock = 1
      paper = 2
      scissors = 3

      win = 6
      draw = 3
      lose = 0
   in case head pair of
        -- Opponent rock
        "A" -> case pair !! 1 of
          "X" -> rock + draw
          "Y" -> paper + win
          "Z" -> scissors + lose
          _ -> 0
        -- Paper
        "B" -> case pair !! 1 of
          "X" -> rock + lose
          "Y" -> paper + draw
          "Z" -> scissors + win
          _ -> 0
        -- Scissors
        "C" -> case pair !! 1 of
          "X" -> rock + win
          "Y" -> paper + lose
          "Z" -> scissors + draw
          _ -> 0
        _ -> 0

calculateScorePt2 :: [String] -> Int
calculateScorePt2 pair =
  let rock = 1
      paper = 2
      scissors = 3

      win = 6
      draw = 3
      lose = 0
   in case head pair of
        -- Opponent rock
        "A" -> case pair !! 1 of
          "X" -> lose + scissors
          "Y" -> draw + rock
          "Z" -> win + paper
          _ -> 0
        -- Paper
        "B" -> case pair !! 1 of
          "X" -> lose + rock
          "Y" -> draw + paper
          "Z" -> win + scissors
          _ -> 0
        -- Scissors
        "C" -> case pair !! 1 of
          "X" -> lose + paper
          "Y" -> draw + scissors
          "Z" -> win + rock
          _ -> 0
        _ -> 0
