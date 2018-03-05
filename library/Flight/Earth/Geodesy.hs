{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.Geodesy
    ( DirectProblem(..)
    , DirectSolution(..)
    , InverseProblem(..)
    , InverseSolution(..)
    , DProb, DSoln
    , IProb, ISoln
    ) where

type DMS = Int
type Distance = Int

-- | The inputs for the direct or forward problem in geodesy.
data DirectProblem a α s =
    DirectProblem
        { x :: a -- ^ The departure point on the ellipsoid.
        }

-- | The inputs for the inverse or reverse problem in geodesy.
data InverseProblem a =
    InverseProblem
        { x :: a -- ^ The departure point.
        }

-- | The outputs for the solution to the direct or forward problem in geodesy.
data DirectSolution a α =
    DirectSolution
        { y :: a -- ^ The arrival point.
        }

-- | The outputs for the solution to the inverse or reverse problem in geodesy.
data InverseSolution s α =
    InverseSolution
        { s :: s -- ^ The distance between departure and arrival points.
        }

type DProb = DirectProblem (DMS, DMS) DMS Distance
type DSoln = DirectSolution (DMS, DMS) DMS

type IProb = InverseProblem (DMS, DMS)
type ISoln = InverseSolution Distance DMS
