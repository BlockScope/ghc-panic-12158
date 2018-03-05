{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.Geodesy (DirectProblem(..), InverseProblem(..)) where

-- | The inputs for the direct or forward problem in geodesy.
data DirectProblem a =
    DirectProblem
        { x :: a -- ^ The departure point on the ellipsoid.
        }

-- | The inputs for the inverse or reverse problem in geodesy.
data InverseProblem a =
    InverseProblem
        { x :: a -- ^ The departure point.
        }
