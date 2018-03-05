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

There are some fixes;

1. Add `DuplicateRecordFields`.

```
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE DuplicateRecordFields #-}
module GhcPanic12158 where

import qualified Geodesy as G (X(..))
import Geodesy (Y(..))

update :: G.X a -> G.X a
update G.X{x} = G.X{x = x}
```

2. Use qualified field names.

```
{-# LANGUAGE NamedFieldPuns #-}
module GhcPanic12158 where

import qualified Geodesy as G (X(..))
import Geodesy (Y(..))

update :: G.X a -> G.X a
update G.X{G.x} = G.X{G.x = x}
```

Interestingly, if I don't import the record with the clashing field name then GHC complains.

```
{-# LANGUAGE NamedFieldPuns #-}
module GhcPanic12158 where

import qualified Geodesy as G (X(..))

update :: G.X a -> G.X a
update G.X{x} = G.X{x = x}
```

```
> stack build
ghc-panic-translateConPatVec-lookup-0.1.0: unregistering (local file changes: library/GhcPanic12158.hs)
ghc-panic-translateConPatVec-lookup-0.1.0: build (lib)
Preprocessing library for ghc-panic-translateConPatVec-lookup-0.1.0..
Building library for ghc-panic-translateConPatVec-lookup-0.1.0..
[3 of 3] Compiling GhcPanic12158

/ghc-panic-12158/earth/library/GhcPanic12158.hs:8:12: error: Not in scope: ‘x’
  |
8 | update G.X{x} = G.X{x = x}
  |            ^

/ghc-panic-12158/earth/library/GhcPanic12158.hs:8:21: error: Not in scope: ‘x’
  |
8 | update G.X{x} = G.X{x = x}
```

A later version of GHC doesn't panic.

```
# stack.yaml
resolver: ghc-8.4.0.20180118
compiler: ghc-8.4.0.20180118
compiler-check: match-exact
```

```
> stack build
ghc-panic-translateConPatVec-lookup-0.1.0: build (lib)
Preprocessing library for ghc-panic-translateConPatVec-lookup-0.1.0..
Building library for ghc-panic-translateConPatVec-lookup-0.1.0..
[2 of 3] Compiling GhcPanic12158

/earth/library/GhcPanic12158.hs:9:12: error:
    • Constructor ‘G.X’ does not have field ‘x’
    • In the pattern: G.X {x}
      In an equation for ‘update’: update G.X {x} = G.X {x = x}
  |
9 | update G.X{x} = G.X{x = x}
```
