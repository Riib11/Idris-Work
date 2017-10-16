module Main

main : IO ()
main = putStrLn ?greeting
-- ?greeting is a hole, represting an incomplete part of program
-- can check type of greeting though with `:t greeting`