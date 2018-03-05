{-# LANGUAGE NamedFieldPuns #-}

module GhcPanic12158 where

import qualified Geodesy as G (X(..))
import Geodesy (Y(..))

updateDistance :: G.X a -> G.X a
updateDistance G.X{x} = G.X{x = x}
