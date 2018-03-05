{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.GhcPanic12158 where

import qualified Flight.Earth.Geodesy as G (DirectProblem(..))
import Flight.Earth.Geodesy (InverseProblem(..))

updateDistance :: G.DirectProblem a -> G.DirectProblem a
updateDistance G.DirectProblem{x} =
    prob'
    where
        prob' =
            G.DirectProblem{x = x}
