{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.GhcPanic12158 where

import Data.Maybe (catMaybes)
import qualified Flight.Earth.Geodesy as G (DirectProblem(..))
import Flight.Earth.Geodesy (InverseProblem(..), DProb)

updateDistance :: DProb -> DProb
updateDistance G.DirectProblem{x} =
    prob'
    where
        prob' =
            G.DirectProblem{x = x}
