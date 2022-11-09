# ELM Aviary

An elm implementation of the birds from combinatory logic.

Each bird in the Aviary represents a [function composition pattern](https://en.wikipedia.org/wiki/Function_composition) and each bird is implemented, as far as is possible, using [SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus) under the hood.

## Installation

```sh
    elm install jamesrweb/elm-aviary
```

## Usage

To import all birds, add the following at the top of your file:

```elm
    import Aviary.Birds exposing (..)
```

You can also just import specific birds such as the Kestrel and Psi for example:

```elm
    import Aviary.Birds exposing (kestrel, psi)
```

## Development

### Formatting

```sh
npx elm-format . --yes
```

### Linting

```sh
npx elm-review .
```

### Tests

```sh
npx elm-verify-examples -r
```