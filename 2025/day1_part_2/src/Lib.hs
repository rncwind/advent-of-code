module Lib
    ( makeDirection
    , makeDialMove
    , handleMove
    , handleTurn
    , wrappingAdd
    ) where


import Debug.Trace

data Direction = RightTurn | LeftTurn deriving (Enum, Show)
makeDirection :: Char -> Direction
makeDirection x =
    case x of
        'R' -> RightTurn
        'L' -> LeftTurn
        _ -> error "Turns must be in format LXX or RXX"

data DialMove = DialMove{direction :: Direction 
                          , amount :: Int} deriving Show

makeDialMove :: String -> DialMove
makeDialMove (dir:amt) =
    DialMove{direction = makeDirection dir
            , amount = read amt :: Int}

makeDialMove [] = error "makeDialMove has no head and tail"

handleMove :: [DialMove] -> Int -> Int -> Int
handleMove (move:rest) position password = let
    dir = direction move
    amt = amount move
    result = case dir of
        RightTurn -> handleTurn amt position password
        LeftTurn -> handleTurn (-amt) position password in
    --traceShow ("move ", move, "position: ", position, "password: ", password, "result: ", result)
    handleMove rest (fst result) (snd result)

handleMove [] _ password = do
    password

-- handleTurn :: Int -> Int -> Int -> (Int, Int)
-- handleTurn turn_amount position password = let
--            new_pos = wrappingAdd turn_amount position in
--     if new_pos == 0 then
--        (new_pos, password + 1)
--     else
--         (new_pos, password)

-- wrappingAdd :: Int -> Int -> Int
-- wrappingAdd turn_amount position =
--     if position + turn_amount < 0 then
--         -- traceShow ("pos+turn < 0", "turn_amount", turn_amount, "position", position)
--         wrappingAdd (100 - abs(turn_amount)) position
--     else
--         if position + turn_amount >= 100 then
--            -- traceShow ("pos+turn > 0 AND pos+turn > 100", "turn_amount", turn_amount, "position", position)
--             wrappingAdd (abs(turn_amount) - 100) position
--         else
--            -- traceShow ("pos+turn > 0, base case", "turn_amount", turn_amount, "position", position)
--             position + turn_amount
