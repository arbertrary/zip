module Main
  ( main
  ) where

import Codec.Archive.Zip
import Data.Map
import System.Environment (getArgs, getExecutablePath)
import System.Exit (exitFailure)
import System.FilePath

main :: IO ()
main = do
  print "Start:"
  -- let executable = "self-extracting-zip"
  -- let executable = "testfile.zip"
  args <- getArgs
  -- status <- withFile executable ReadMode hLookAhead
  entries <- withArchive (head args) getEntries
  mapM_ print $ keys entries
-- main = do
--   [operation, input, output] <- getArgs
--   case operation of
--     "compress" -> do
--       selector <- mkEntrySelector (takeFileName input)
--       createArchive output (loadEntry Deflate selector input)
--     "uncompress" ->
--       withArchive input (unpackInto output)
--     _ -> do
--       putStrLn "Unknown command."
--       exitFailure
