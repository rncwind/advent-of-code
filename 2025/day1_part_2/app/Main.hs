module Main (main) where

import Lib

main :: IO ()
main = do
    file <- readFile "input.txt"
    let split = lines file
    let moves = map makeDialMove split
    --putStrLn (show moves)
    let password = handleMove moves 50 0
    print password
    --someFunc
