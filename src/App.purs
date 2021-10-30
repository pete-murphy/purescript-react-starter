module App where

import Prelude

import Data.Foldable as Foldable
import Effect.Class.Console as Console
import Effect.Timer as Timer
import React.Basic.DOM as R
import React.Basic.DOM.Events as DOM.Events
import React.Basic.Events as Events
import React.Basic.Hooks (Component, (/\))
import React.Basic.Hooks as React

mkApp :: Component Unit
mkApp = do
  React.component "App" \_ -> React.do
    text /\ setText <- React.useState' ""
    timer /\ setTimer <- React.useState 0
    React.useEffect text do
      handle <- Timer.setInterval 1_000 (setTimer (_ + 1))
      pure (setTimer (\_ -> 0) *> Timer.clearInterval handle)
    pure
      ( R.div_
          [ R.input
              { onChange:
                  Events.handler DOM.Events.targetValue
                    ( Foldable.traverse_ \value -> do
                        Console.log value
                        setText value
                    )
              , value: text
              }
          , R.p_ [ R.text (show timer) ]
          ]
      )