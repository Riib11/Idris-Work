module Main

-- some IO types

MaybeFileIn : Type
MaybeFileIn = IO (Either FileError File)

MaybeStringIn : Type
MaybeStringIn = IO (Either FileError String)

MaybeOut : Type
MaybeOut = IO (Either FileError ())

Out : Type
Out = IO ()

{- examples: some IO function types -}

{-
openFile : (f:String) -> (m:Mode) -> MaybeFileIn
fGetLine : (h:File) -> MaybeStringIn
fPutStr  : (h:File) -> (str:String) -> MaybeOut
fEOF     : File -> IO Bool
-}

-- main

greet : Out
greet = do putStr "What is your name?"
           name <- getLine
           putStrLn ("Hello" ++ name)

main : Out
main = greet