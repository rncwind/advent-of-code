import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "handleTurn" $ do
        it "Returns (0,1) when given a left move of -50" $ do
            handleTurn (-50) 50 0 == (0,1)
        it "Returns (10,0) when given a left move of -240" $ do
            handleTurn (-240) 50 0 == (10, 0)
        it "Returns (60,0) when given a right move of 510" $ do
           handleTurn 510 50 0 == (60,0)
    describe "handleMove" $ do
        it "Handles the first 3 in the test file correctly" $ do
           let moves = [makeDialMove "L68", makeDialMove "L30", makeDialMove "R48"]
           handleMove moves 50 0 == 1
        it "Handles the test file correctly" $ do
           file <- readFile "test.txt"
           let split = lines file
           let moves = map makeDialMove split
           handleMove moves 50 0 `shouldBe` 3
           
