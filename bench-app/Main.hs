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
  let executable = "self-extracting-zip_test"
  -- let executable = "testfile.zip"
  -- executable <- getArgs
  -- status <- withFile executable ReadMode hLookAhead
  entries <- withArchive executable getEntries
  mapM_ print $ keys entries
  putStrLn "test"
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
