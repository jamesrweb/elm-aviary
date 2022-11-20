module Aviary.Birds exposing (identity, kestrel, bluebird, cardinal, applicator, psi, becard, blackbird, bluebirdPrime, bunting, cardinalPrime, cardinalStar, cardinalStarStar, dickcissel, dove, dovekie, eagle, eaglebald, finch, finchStar, finchStarStar, goldfinch, hummingbird, identityStar, identityStarStar, jayStar, jayPrime, jay, kite, owl, phoenix, quacky, queer, quirky, quixotic, quizzical, robin, robinStar, robinStarStar, starling, starlingPrime, thrush, vireo, vireoStar, vireoStarStar, warbler, warbler1, warblerStar, warblerStarStar)

{-| This module represents each bird available within the Aviary.


# Birds

@docs identity, kestrel, bluebird, cardinal, applicator, psi, becard, blackbird, bluebirdPrime, bunting, cardinalPrime, cardinalStar, cardinalStarStar, dickcissel, dove, dovekie, eagle, eaglebald, finch, finchStar, finchStarStar, goldfinch, hummingbird, identityStar, identityStarStar, jayStar, jayPrime, jay, kite, owl, phoenix, quacky, queer, quirky, quixotic, quizzical, robin, robinStar, robinStarStar, starling, starlingPrime, thrush, vireo, vireoStar, vireoStarStar, warbler, warbler1, warblerStar, warblerStarStar

-}

import Combinators


{-| Identity, also known as "idiot".

Returns whatever it is given.

    Aviary.Birds.identity 1 --> 1

    Aviary.Birds.identity [ 1, 2, 3 ] --> [1, 2, 3]

    Aviary.Birds.identity String.fromInt --> String.fromInt

-}
identity : a -> a
identity =
    Combinators.i


{-| Kestrel.

Returns the first argument provided, ignoring the second.

    kestrel "hello" 2 --> "hello"

    kestrel Nothing [ 1, 2, 3 ] --> Nothing

    kestrel String.fromInt (Just 2) --> String.fromInt

-}
kestrel : a -> b -> a
kestrel =
    Combinators.k


{-| Bluebird.

Composes the given functions with the final value.

The equivilent of the composition operator `(<<)` in Elm.

    isEven : Int -> Bool
    isEven n = modBy 2 n == 0

    double : number -> number
    double = ((*) 2)

    bluebird not isEven 2 --> False
    bluebird not isEven 1 --> True
    bluebird String.fromInt double 4 --> "8"

-}
bluebird : (b -> c) -> (a -> b) -> a -> c
bluebird =
    Combinators.b


{-| Cardinal, also known as "flip".

Takes a binary function and two further arguments which are then applied inversely.

    multiplyList : List Int -> Int -> List Int
    multiplyList items multiple =
        List.map ((*) multiple) items

    cardinal multiplyList 10 [1, 2, 3] --> [10, 20, 30]

Useful in pipelines where the piped value is required to be the first argument to a function.

    [1, 2, 3]
        |> cardinal multiplyList 5
        |> List.sum
    --> 30

-}
cardinal : (a -> b -> c) -> b -> a -> c
cardinal =
    Combinators.c


{-| Applicator.

Calls a given function with a given argument.

Sometimes referred to as "the reverse pipe operator".

The equivilent of the "pipe left" operator `(<|)` in Elm.

    applicator String.fromInt 1 --> "1"

    applicator List.sum [ 1, 2, 3 ] --> 6

-}
applicator : (a -> b) -> a -> b
applicator =
    Combinators.a


{-| Psi.

Transforms two inputs and combines the outputs.

Equivelent of the [on](https://hackage.haskell.org/package/base-4.17.0.0/docs/Data-Function.html#v:on) operator in Haskell.

    add : number -> number -> number
    add = (+)

    double : number -> number
    double = ((*) 2)

    psi add double 3 12 --> 30

-}
psi : (b -> b -> c) -> (a -> b) -> a -> a -> c
psi =
    Combinators.p


{-| Becard.

Triple composition of a given value.

    becard (\n -> n + 15) (\n -> n - 10) (\n -> n * 2) 50 --> 105

    becard (Aviary.Birds.cardinal String.append "1") ((++) "2") String.fromInt 50 --> "2501"

-}
becard : (c -> d) -> (b -> c) -> (a -> b) -> a -> d
becard =
    Combinators.b3


{-| Blackbird.

    blackbird String.toFloat String.append "3" ".14" --> Just 3.14

    blackbird (modBy 2) (\x y -> x * y) 2 3 --> 0

-}
blackbird : (b -> c) -> (a -> d -> b) -> a -> d -> c
blackbird =
    Combinators.b1


{-| Bluebird prime.

    bluebirdPrime (+) 1 Aviary.Birds.identity 2 --> 3

    bluebirdPrime (++) [ 1, 2, 3 ] List.singleton 4 --> [1, 2, 3, 4]

-}
bluebirdPrime : (a -> c -> d) -> a -> (b -> c) -> b -> d
bluebirdPrime =
    Combinators.bp


{-| Bunting.

    createUser : String -> Int -> Bool -> { name : String , age : Int , online : Bool }
    createUser name age online = {
        name = name ,
        age = age ,
        online = online
        }

    incrementUserAge : { name : String , age : Int , online : Bool } -> { name : String , age : Int , online : Bool }
    incrementUserAge user =
        { user | age = user.age + 1 }

    bunting List.sum (\x y z -> [x, y, z]) 1 2 3 --> 6
    bunting incrementUserAge createUser "John" 36 True --> { name = "John", age = 37, online = True }

-}
bunting : (d -> e) -> (a -> b -> c -> d) -> a -> b -> c -> e
bunting =
    Combinators.b2


{-| Cardinal Prime.

    cardinalPrime (+) ((-) 1) 5 10 --> -4

    cardinalPrime List.append List.singleton [ 3, 2, 1 ] 4 --> [4, 3, 2, 1]

-}
cardinalPrime : (c -> a -> d) -> (b -> c) -> a -> b -> d
cardinalPrime =
    Combinators.cp


{-| Cardinal once removed.

Flips the third and fourth arguments when applied to the given ternary function.

    cardinalStar Basics.clamp 100 200 150 --> 150

    cardinalStar (\four six three -> four + six * three) 4 3 6 --> 22

-}
cardinalStar : (a -> c -> b -> d) -> a -> b -> c -> d
cardinalStar =
    Combinators.cs


{-| Cardinal twice removed.

Flips the fourth and fifth arguments when applied to the given quaternary function.

    cardinalStarStar (\two four six three -> (two - four + six) * three) 2 4 3 6 --> 12

-}
cardinalStarStar : (a -> b -> d -> c -> e) -> a -> b -> c -> d -> e
cardinalStarStar =
    Combinators.css


{-| Dickcissel.

    dickcissel Basics.clamp 100 200 ((*) 2) 110 --> 200

-}
dickcissel : (a -> b -> d -> e) -> a -> b -> (c -> d) -> c -> e
dickcissel =
    Combinators.d1


{-| Dove.

    dove (+) 5 Basics.identity 2 --> 7

-}
dove : (a -> c -> d) -> a -> (b -> c) -> b -> d
dove =
    Combinators.d


{-| Dovekie.

    dovekie (+) Basics.identity 2 ((*) 2) 11 --> 24

-}
dovekie : (c -> d -> e) -> (a -> c) -> a -> (b -> d) -> b -> e
dovekie =
    Combinators.d2


{-| Eagle.

    eagle (+) 6 (*) 2 3 --> 12

-}
eagle : (a -> d -> e) -> a -> (b -> c -> d) -> b -> c -> e
eagle =
    Combinators.e


{-| Bald eagle.

    eaglebald (+) (-) 50 25 (*) 3 2 --> 31

-}
eaglebald : (e -> f -> g) -> (a -> b -> e) -> a -> b -> (c -> d -> f) -> c -> d -> g
eaglebald =
    Combinators.eb


{-| Finch.

    finch 6 2 (-) --> -4

    finch "Hi" 3 String.repeat --> "HiHiHi"

-}
finch : a -> b -> (b -> a -> c) -> c
finch =
    Combinators.f


{-| Finch once removed.

Reverses the second, third and fourth arguments when applied to the given ternary function.

    finchStar Basics.clamp 120 200 100 --> 120

-}
finchStar : (c -> b -> a -> d) -> a -> b -> c -> d
finchStar =
    Combinators.fs


{-| Finch twice removed.

Flips the third and fifth arguments when applied to the given quaternary function.

    finchStar Basics.clamp 120 200 100 --> 120

-}
finchStarStar : (a -> d -> c -> b -> e) -> a -> b -> c -> d -> e
finchStarStar =
    Combinators.fss


{-| Goldfinch.

    goldfinch (+) ((*) 2) 6 1 --> 13

-}
goldfinch : (b -> c -> d) -> (a -> c) -> a -> b -> d
goldfinch =
    Combinators.g


{-| Hummingbird.

    hummingbird (\x1 y x2 -> ( x1, x2, y )) 1 2 --> (1, 1, 2)

-}
hummingbird : (a -> b -> a -> c) -> a -> b -> c
hummingbird =
    Combinators.h


{-| Identity bird once removed.

    identityStar (\n -> n - 1) 10 --> 9

-}
identityStar : (a -> b) -> a -> b
identityStar =
    Combinators.is


{-| Identity bird twice removed

    identityStarStar (\n m -> n - m) 10 4 --> 6

-}
identityStarStar : (a -> b -> c) -> a -> b -> c
identityStarStar =
    Combinators.iss


{-| Jay once removed.

    jayStar Basics.identity 10 20 --> 10

-}
jayStar : (a -> c) -> a -> b -> c
jayStar =
    Combinators.js


{-| Jay Prime.

    jayPrime (+) 10 20 40 --> 30

-}
jayPrime : (a -> b -> d) -> a -> b -> c -> d
jayPrime =
    Combinators.jp


{-| Jay.

    jay (+) 10 20 40 --> 70

-}
jay : (a -> b -> b) -> a -> b -> a -> b
jay =
    Combinators.j


{-| Kite.

Returns the second argument provided, ignoring the first.

    kite "hello" 2 --> 2

    kite Nothing [ 1, 2, 3 ] --> [ 1, 2, 3 ]

    kite String.fromInt (Just 2) --> Just 2

-}
kite : a -> b -> b
kite =
    Combinators.ki


{-| Owl.

    owl (\f -> f 2 6) (+) 5 --> 13

-}
owl : ((a -> b) -> a) -> (a -> b) -> b
owl =
    Combinators.o


{-| Phoenix.

This is equivilant to the [Starling Prime](#starlingPrime) combinator.

    phoenix (+) ((*) 2) ((-) 3) 5 --> 8

-}
phoenix : (b -> c -> d) -> (a -> b) -> (a -> c) -> a -> d
phoenix =
    Combinators.px


{-| Quacky bird.

    quacky 10 ((+) 2) ((*) 4) --> 48

    quacky "John" String.toUpper (\name -> "My name is " ++ name) --> "My name is JOHN"

-}
quacky : a -> (a -> b) -> (b -> c) -> c
quacky =
    Combinators.q4


{-| Queer bird.

Reverse function composition.

    queer ((+) 2) ((*) 4) 10 --> 48

    queer String.toUpper (\name -> "My name is " ++ name) "John" --> "My name is JOHN"

-}
queer : (a -> b) -> (b -> c) -> a -> c
queer =
    Combinators.q


{-| Quirky bird.

    quirky ((+) 2) 10 ((*) 4) --> 48

    quirky String.toUpper "John" (\name -> "My name is " ++ name) --> "My name is JOHN"

-}
quirky : (a -> b) -> a -> (b -> c) -> c
quirky =
    Combinators.q3


{-| Quixotic bird.

    quixotic ((+) 2) 10 ((*) 4) --> 42

    quixotic String.toUpper "John" (\name -> "My name is " ++ name) --> "MY NAME IS JOHN"

-}
quixotic : (b -> c) -> a -> (a -> b) -> c
quixotic =
    Combinators.q1


{-| Quizzical bird.

    quizzical 10 ((+) 2) ((*) 4) --> 42

    quizzical "John" String.toUpper (\name -> "My name is " ++ name) --> "MY NAME IS JOHN"

-}
quizzical : a -> (b -> c) -> (a -> b) -> c
quizzical =
    Combinators.q2


{-| Robin.

    robin 10 (-) 12 --> 2

    robin "second" (\a b -> a ++ " " ++ b) "first" --> "first second"

-}
robin : a -> (b -> a -> c) -> b -> c
robin =
    Combinators.r


{-| Robin once removed.

    robinStar Basics.clamp 10 100 200 --> 100

    robinStar Basics.clamp 110 100 200 --> 110

    robinStar Basics.clamp 220 100 200 --> 200

-}
robinStar : (b -> c -> a -> d) -> a -> b -> c -> d
robinStar =
    Combinators.rs


{-| Robin twice removed.

    robinStarStar (\six nine ten four -> six - nine + ten * four) 6 4 9 10 --> 37

-}
robinStarStar : (a -> c -> d -> b -> e) -> a -> b -> c -> d -> e
robinStarStar =
    Combinators.rss


{-| Starling.

    starling (+) ((*) 2) 10 --> 30

    starling (-) (\v -> v * 7) 4 --> -24

    starling (\user newAge -> { user | age = newAge }) (\user -> user.age + 1) { age = 35 } --> { age = 36 }

-}
starling : (a -> b -> c) -> (a -> b) -> a -> c
starling =
    Combinators.s


{-| Starling Prime.

    starlingPrime (+) ((*) 2) ((-) 3) 5 --> 8

-}
starlingPrime : (b -> c -> d) -> (a -> b) -> (a -> c) -> a -> d
starlingPrime =
    Combinators.sp


{-| Thrush.

Sometimes referred to as "the forward pipe operator".

The equivilent of the "pipe right" operator `(|>)` in Elm.

    thrush 1 Basics.identity --> 1

    thrush 20 ((+) 2) --> 22

    thrush "Hello" (\v -> v ++ " world!") --> "Hello world!"

-}
thrush : a -> (a -> b) -> b
thrush =
    Combinators.t


{-| Vireo.

    vireo 1 2 (+) --> 3

    vireo 3 "Hello" String.repeat --> "HelloHelloHello"

-}
vireo : a -> b -> (a -> b -> c) -> c
vireo =
    Combinators.v


{-| Vireo once removed.

    vireoStar (\two one three -> one + two - three) 1 2 3 --> 0

-}
vireoStar : (b -> a -> b -> d) -> a -> b -> b -> d
vireoStar =
    Combinators.vs


{-| Vireo twice removed.

    vireoStarStar (\one four two three -> (one + two) - (three + four)) 1 2 3 4 --> -4

-}
vireoStarStar : (a -> c -> b -> c -> e) -> a -> b -> c -> c -> e
vireoStarStar =
    Combinators.vss


{-| Warbler.

Provides a given argument as both values to a given binary function.

    warbler (+) 2 --> 4

-}
warbler : (a -> a -> b) -> a -> b
warbler =
    Combinators.w


{-| Converse warbler.

The [warbler](#warbler) but with the input arguments reversed.

    warbler1 2 (+) --> 4

-}
warbler1 : a -> (a -> a -> b) -> b
warbler1 =
    Combinators.w1


{-| Warbler once removed.

    warblerStar (\x y z -> [ x, y, z ]) 1 2 --> [1, 2, 2]

-}
warblerStar : (a -> b -> b -> c) -> a -> b -> c
warblerStar =
    Combinators.ws


{-| Warbler twice removed.

    warblerStarStar (\w x y z -> [ w, x, y, z ]) 1 2 3 --> [1, 2, 3, 3]

-}
warblerStarStar : (a -> b -> c -> c -> d) -> a -> b -> c -> d
warblerStarStar =
    Combinators.wss
