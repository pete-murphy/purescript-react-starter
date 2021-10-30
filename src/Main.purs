module Main where

import Prelude

import App (mkApp)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  maybeRoot <- window
    >>= document
    >>= toNonElementParentNode
      >>> getElementById "root"
  case maybeRoot of
    Nothing -> throw "Root element not found."
    Just root -> do
      app <- mkApp
      render (app unit) root
