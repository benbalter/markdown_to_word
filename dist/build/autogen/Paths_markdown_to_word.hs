module Paths_markdown_to_word (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/benbalter/.cabal/bin"
libdir     = "/Users/benbalter/.cabal/lib/x86_64-osx-ghc-7.10.1/markd_2Ep61gJlNxBLPz91ASyQSB"
datadir    = "/Users/benbalter/.cabal/share/x86_64-osx-ghc-7.10.1/markdown-to-word-0.0.1"
libexecdir = "/Users/benbalter/.cabal/libexec"
sysconfdir = "/Users/benbalter/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "markdown_to_word_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "markdown_to_word_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "markdown_to_word_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "markdown_to_word_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "markdown_to_word_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
