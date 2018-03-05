# ghc-panic-12158
Minimal reproduction of https://ghc.haskell.org/trac/ghc/ticket/12158

```
{-# LANGUAGE DuplicateRecordFields #-}

module Geodesy (X(..), Y(..)) where

data X a = X {x :: a}
data Y a = Y {x :: a}
```

```
{-# LANGUAGE NamedFieldPuns #-}

module GhcPanic12158 where

import qualified Geodesy as G (X(..))
import Geodesy (Y(..))

update :: G.X a -> G.X a
update G.X{x} = G.X{x = x}
```

```
> stack build
ghc-panic-translateConPatVec-lookup-0.1.0: build (lib)
Preprocessing library for ghc-panic-translateConPatVec-lookup-0.1.0..
Building library for ghc-panic-translateConPatVec-lookup-0.1.0..
[1 of 3] Compiling Geodesy
[2 of 3] Compiling GhcPanic12158
ghc: panic! (the 'impossible' happened)
  (GHC version 8.2.2 for x86_64-apple-darwin):
	translateConPatVec: lookup

Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug
```
