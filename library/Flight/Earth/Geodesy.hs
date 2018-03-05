{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}

module Flight.Earth.Geodesy (DirectProblem(..), InverseProblem(..)) where

data DirectProblem a = DirectProblem {x :: a}
data InverseProblem a = InverseProblem {x :: a}
