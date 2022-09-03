module App where

import Prelude

import Data.Foldable as Foldable
import Effect.Class.Console as Console
import Effect.Timer as Timer
import React.Basic.DOM as DOM
import React.Basic.DOM.Events as DOM.Events
import React.Basic.Events as Events
import React.Basic.Hooks (Component, (/\))
import React.Basic.Hooks as Hooks

mkApp :: Component Unit
mkApp = do
  Hooks.component "App" \_ -> Hooks.do
    text /\ setText <- Hooks.useState' ""
    timer /\ setTimer <- Hooks.useState 0
    Hooks.useEffect text do
      handle <- Timer.setInterval 1_000 (setTimer (_ + 1))
      pure (setTimer (\_ -> 0) *> Timer.clearInterval handle)
    pure
      ( DOM.div_
          [ DOM.input
              { onChange:
                  Events.handler DOM.Events.targetValue
                    ( Foldable.traverse_ \value -> do
                        Console.log value
                        setText value
                    )
              , value: text
              }
          , DOM.p_ [ DOM.text (show timer) ]
          ]
      )