{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.GI.Base
import qualified GI.Gtk             as Gtk
import           SortingAlgorithms 


main :: IO ()
main = do
  Gtk.init Nothing

  win <- new Gtk.Window [#title := "Functional Sorting Algoritms"]
  on win #destroy Gtk.mainQuit
  #resize win 640 480

  msg <- new Gtk.Label [#label := "Hello"]
  #add win msg

  #showAll win

  Gtk.main