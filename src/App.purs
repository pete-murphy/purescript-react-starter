module App where

import Prelude

import Data.Maybe (Maybe(..))
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
      pure do
        setTimer (\_ -> 0)
        Timer.clearInterval handle

    pure
      ( DOM.div_
          [ DOM.input
              { onChange:
                  Events.handler DOM.Events.targetValue
                    case _ of
                      Just value -> do
                        Console.log value
                        setText value

                      Nothing -> mempty

              , value: text
              }
          , DOM.p_ [ DOM.text ("It's been " <> show timer <> " seconds since text was entered in the textbox") ]
          ]
      )
