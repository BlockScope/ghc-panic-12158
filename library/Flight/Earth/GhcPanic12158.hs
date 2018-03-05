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
import Flight.Earth.Geodesy
    ( InverseProblem(..)
    , DProb, DSoln
    , IProb
    )

updateDistance
    :: (DProb, DSoln)
    -> (DProb, DSoln)
updateDistance (G.DirectProblem{x}, soln) =
    (prob', soln)
    where
        prob' =
            G.DirectProblem{x = x}
