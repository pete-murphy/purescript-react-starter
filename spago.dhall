{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "sandbox"
, dependencies =
  [ "console"
  , "effect"
  , "js-timers"
  , "psci-support"
  , "react-basic-dom"
  , "react-basic-hooks"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
