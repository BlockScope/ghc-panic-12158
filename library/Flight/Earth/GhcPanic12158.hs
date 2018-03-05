{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE QuasiQuotes #-}

{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE ParallelListComp #-}

module Flight.Earth.GhcPanic12158 where

import Data.Maybe (catMaybes)
import qualified Flight.Earth.Geodesy as G (DirectProblem(..), DirectSolution(..))
import qualified Flight.Earth.Geodesy as I
import Flight.Earth.Geodesy
    ( GeodesyProblems(..)
    , InverseProblem(..), InverseSolution(..)
    , DProb, DSoln
    , IProb, ISoln
    )

updateDistance
    :: (DProb, DSoln)
    -> (DProb, DSoln)
updateDistance (G.DirectProblem{x, α₁}, soln) =
    (prob', soln)
    where
        prob' =
            G.DirectProblem{x = x, α₁ = α₁}
