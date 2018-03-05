{-# LANGUAGE NamedFieldPuns #-}

module GhcPanic12158 where

import qualified Geodesy as G (X(..))
import Geodesy (Y(..))

update :: G.X a -> G.X a
update G.X{x} = G.X{x = x}
