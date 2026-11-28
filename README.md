# ELM Aviary

An Elm implementation of the birds from
[combinatory logic](https://en.wikipedia.org/wiki/Combinatory_logic), inspired
by the `Haskell Data.Aviary.Birds` package. Each bird is a
[function composition pattern](https://en.wikipedia.org/wiki/Function_composition)
implemented as far as possible using
[SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus)
under the hood. Use it when you want small, pure, composable building blocks for
function composition in Elm.

## Features

- Every classic bird as a typed combinator (Identity, Kestrel, Bluebird, etc.)
- Pure Elm, no JavaScript interop
- Doc examples are compiled and validated by the test suite

## Installation

```sh
elm install jamesrweb/elm-aviary
```

## Usage

Import everything from the single exposed module:

```elm
import Aviary.Birds exposing (..)
```

Or import only the birds you need and call them, for example the Kestrel:

```elm
import Aviary.Birds exposing (kestrel)

result =
    kestrel "kept" "ignored"
```

Each bird composes with the others, so you can build larger pipelines by nesting
them.

## Repository layout

```
./                      # repository root
├── .agents/            # agent configuration (DotAgents protocol)
├── .github/            # CI and CD workflows plus shared composite actions
├── review/             # elm-review project with the custom rule set
├── src/                # exposed package source
├── tests/              # elm-test suites plus generated verify-examples output
├── .gitattributes      # git attributes
├── .gitignore          # git ignore rules
├── AGENTS.md           # agent-facing documentation
├── biome.json          # Biome config
├── CLAUDE.md           # symlink to AGENTS.md
├── elm.json            # Elm manifest
├── LICENSE             # BSD 3-Clause licence
├── package.json        # pnpm manifest and scripts
├── pnpm-lock.yaml      # pnpm lockfile
├── pnpm-workspace.yaml # pnpm workspace settings
└── README.md           # this file
```

## Development

Install dependencies, then run the gates:

| Command              | Description                                           |
| -------------------- | ----------------------------------------------------- |
| `pnpm format`        | Applies `elm-format` and `Biome` fixes                |
| `pnpm lint`          | Runs the lint checks (the gate)                       |
| `pnpm test`          | Runs the `elm-test` suite and doc examples (the gate) |
| `pnpm coverage`      | Opens the coverage report                             |
| `pnpm documentation` | Opens the module documentation preview                |

The usual flow is to edit, run `pnpm format`, and then `pnpm test`. Every change
must pass `pnpm lint` and `pnpm test`. CI runs these checks automatically.

## Contributing

This is a personal published package. Issues and suggestions are welcome on the
GitHub issue tracker. I make all changes myself.

## Documentation

Module documentation with examples lives in `src/` and is validated by the test
suite. Agent-facing docs for this repo live in `AGENTS.md` and `.agents/`.

## Licence

Licensed under the
[BSD 3-Clause Licence](https://github.com/jamesrweb/elm-aviary/blob/main/LICENSE).
