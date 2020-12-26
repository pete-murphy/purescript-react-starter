module App where

import Prelude

import Data.Maybe (fromMaybe)
import Effect.Class.Console (log)
import Effect.Timer (clearTimeout, setTimeout)
import React.Basic.DOM as R
import React.Basic.DOM.Events (targetValue)
import React.Basic.Events (handler)
import React.Basic.Hooks (Component, component, useState', (/\), useEffect)
import React.Basic.Hooks as React

mkApp :: Component Unit
mkApp = do
  component "App" \_ -> React.do
    text /\ setText <- useState' ""
    useEffect text do
      timeoutId <- setTimeout 1000 (log text)
      pure (clearTimeout timeoutId)
    pure (
      R.div_ [
        R.input {
          onChange: handler targetValue \t -> setText (fromMaybe "" t)
        }
      ]
    )