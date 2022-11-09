module Aviary.Combinators exposing (a, b, b1, b2, b3, bp, c, cp, cs, css, d, d1, d2, e, f, fs, fss, g, h, i, is, iss, j, js, jp, k, ki, o, p, px, q, q1, q2, q3, q4, r, rs, rss, s, sp, t, v, vs, vss, w, w1, ws, wss, ê)

{-|

@docs a, b, b1, b2, b3, bp, c, cp, cs, css, d, d1, d2, e, f, fs, fss, g, h, i, is, iss, j, js, jp, k, ki, o, p, px, q, q1, q2, q3, q4, r, rs, rss, s, sp, t, v, vs, vss, w, w1, ws, wss, ê

-}


{-| The A combinator.

Implemented in terms of the [I](#i) combinator.

-}
a : (a -> b) -> a -> b
a =
    i


{-| The B combinator.

The equivilent of the composition operator (`(<<)`) in Elm.

-}
b : (b -> c) -> (a -> b) -> a -> c
b =
    s (k s) k


{-| The B1 combinator.
-}
b1 : (b -> c) -> (a -> d -> b) -> a -> d -> c
b1 =
    b b b


{-| The B2 combinator.
-}
b2 : (d -> e) -> (a -> b -> c -> d) -> a -> b -> c -> e
b2 =
    b (b b b) b


{-| The B3 combinator.
-}
b3 : (c -> d) -> (b -> c) -> (a -> b) -> a -> d
b3 =
    b (b b) b


{-| The B Prime (B') combinator.
-}
bp : (a -> c -> d) -> a -> (b -> c) -> b -> d
bp bf x uf y =
    bf x (uf y)


{-| The C combinator.
-}
c : (a -> b -> c) -> b -> a -> c
c =
    s (b b s) (k k)


{-| The C Prime (C') combinator.
-}
cp : (c -> a -> d) -> (b -> c) -> a -> b -> d
cp bf uf x y =
    bf (uf y) x


{-| The C Star (C\*) combinator.
-}
cs : (a -> c -> b -> d) -> a -> b -> c -> d
cs =
    b c


{-| The C Star Star (C\*\*) combinator.
-}
css : (a -> b -> d -> c -> e) -> a -> b -> c -> d -> e
css =
    b cs


{-| The D combinator.
-}
d : (a -> c -> d) -> a -> (b -> c) -> b -> d
d =
    b b


{-| The D1 Combinator.
-}
d1 : (a -> b -> d -> e) -> a -> b -> (c -> d) -> c -> e
d1 =
    b (b b)


{-| The D2 combinator.
-}
d2 : (c -> d -> e) -> (a -> c) -> a -> (b -> d) -> b -> e
d2 =
    b b (b b)


{-| The E combinator.
-}
e : (a -> d -> e) -> a -> (b -> c -> d) -> b -> c -> e
e =
    b (b b b)


{-| The F combinator.
-}
f : a -> b -> (b -> a -> c) -> c
f =
    e t t e t


{-| The F Star (F\*) combinator.
-}
fs : (c -> b -> a -> d) -> a -> b -> c -> d
fs =
    b cs rs


{-| The F Star Star (F\*\*) combinator.
-}
fss : (a -> d -> c -> b -> e) -> a -> b -> c -> d -> e
fss =
    b fs


{-| The G combinator.
-}
g : (b -> c -> d) -> (a -> c) -> a -> b -> d
g =
    b b c


{-| The H combinator.
-}
h : (a -> b -> a -> c) -> a -> b -> c
h =
    b w (b c)


{-| The I combinator.
-}
i : a -> a
i =
    s k k


{-| The I Star (I\*) combinator

Implemented in terms of the [I](#i) combinator.

-}
is : (a -> b) -> a -> b
is =
    i


{-| The I Star Star (I\*\*) combinator.

Implemented in terms of the [I](#i) combinator.

-}
iss : (a -> b -> c) -> a -> b -> c
iss =
    i


{-| The J combinator.

This is the J combinator of the literature.

-}
j : (a -> b -> b) -> a -> b -> a -> b
j =
    b (b c) (w (b c (b (b b b))))


{-| The J Star (J\*) combinator.

This is the J combinator of Joy. It is not the jay combinator (J) of the literature.

Credit: Rayward-Smith and Burton (See Antoni Diller 'Compiling Functional Languages' page 104).

-}
js : (a -> c) -> a -> b -> c
js uf x _ =
    uf x


{-| The J Prime (J') combinator - prime of the [J Star](#js) (Joy) combinator.

Credit: Rayward-Smith and Burton (See Antoni Diller 'Compiling Functional Languages' page 104).

-}
jp : (a -> b -> d) -> a -> b -> c -> d
jp bf x y _ =
    bf x y


{-| The K combinator.

Corresponds to the encoding of `true` in lambda calculus.

-}
k : a -> b -> a
k =
    Basics.always


{-| The KI combinator.

Corresponds to the encoding of `false` in lambda calculus.

-}
ki : a -> b -> b
ki =
    k i


{-| The O combinator.
-}
o : ((a -> b) -> a) -> (a -> b) -> b
o x y =
    y (x y)


{-| The P combinator.
-}
p : (b -> b -> c) -> (a -> b) -> a -> a -> c
p bf uf x y =
    bf (uf x) (uf y)


{-| The Pheonix (Big Phi) combinator, also known as Turner's S Prime (S') combinator.

Equivilant to [S Prime](#sp) here and known to Haskell programmers as liftA2 and liftM2 for the Applicative and Monad instances of (->).

-}
px : (b -> c -> d) -> (a -> b) -> (a -> c) -> a -> d
px =
    sp


{-| The Q combinator.
-}
q : (a -> b) -> (b -> c) -> a -> c
q =
    c b


{-| The Q1 combinator.
-}
q1 : (b -> c) -> a -> (a -> b) -> c
q1 =
    b c b


{-| The Q2 combinator.
-}
q2 : a -> (b -> c) -> (a -> b) -> c
q2 =
    c (b c b)


{-| The Q3 combinator.
-}
q3 : (a -> b) -> a -> (b -> c) -> c
q3 =
    b t


{-| The Q4 combinator.
-}
q4 : a -> (a -> b) -> (b -> c) -> c
q4 =
    fs b


{-| The R combinator.
-}
r : a -> (b -> a -> c) -> b -> c
r =
    b b t


{-| The R Star (R\*) combinator.
-}
rs : (b -> c -> a -> d) -> a -> b -> c -> d
rs =
    cs cs


{-| The R Star Star (R\*\*) combinator.
-}
rss : (a -> c -> d -> b -> e) -> a -> b -> c -> d -> e
rss =
    b rs


{-| The S combinator.
-}
s : (a -> b -> c) -> (a -> b) -> a -> c
s bf uf x =
    bf x (uf x)


{-| The S Prime (S') combinator.
-}
sp : (b -> c -> d) -> (a -> b) -> (a -> c) -> a -> d
sp bf uf1 uf2 x =
    bf (uf1 x) (uf2 x)


{-| The T combinator.
-}
t : a -> (a -> b) -> b
t =
    c i


{-| The V combinator.
-}
v : a -> b -> (a -> b -> c) -> c
v =
    b c t


{-| The V Star (V\*) combinator.
-}
vs : (b -> a -> b -> d) -> a -> b -> b -> d
vs tf x y z =
    tf y x z


{-| The V Star Star (V\*\*) combinator.
-}
vss : (a -> c -> b -> c -> e) -> a -> b -> c -> c -> e
vss qf x y z l =
    qf x l y z


{-| The W combinator.
-}
w : (a -> a -> b) -> a -> b
w bf x =
    -- Can be implemented as `c b m r` if the M combinator is ever implementable.
    bf x x


{-| The W1 combinator.

The [W](#w) combinator but with the arguments reversed.

-}
w1 : a -> (a -> a -> b) -> b
w1 =
    c w


{-| The W Star (W\*) combinator.
-}
ws : (a -> b -> b -> c) -> a -> b -> c
ws =
    b w


{-| The W Star Star (W\*\*) combinator.
-}
wss : (a -> b -> c -> c -> d) -> a -> b -> c -> d
wss =
    b (b w)


{-| The Ê Combinator.
-}
ê :
    (e -> f -> g)
    -> (a -> b -> e)
    -> a
    -> b
    -> (c -> d -> f)
    -> c
    -> d
    -> g
ê =
    b (b b b) (b (b b b))
