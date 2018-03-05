{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.GhcPanic12158 where

import qualified Flight.Earth.Geodesy as G (X(..))
import Flight.Earth.Geodesy (Y(..))

updateDistance :: G.X a -> G.X a
updateDistance G.X{x} = G.X{x = x}
