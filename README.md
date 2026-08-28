# Position

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Layout value types for Swift — a vocabulary describing how items are positioned and how space is distributed along an axis, with zero platform dependencies.

---

## Quick Start

`Distribution` describes how remaining space — what is left after item sizes and minimum spacing are accounted for — is allocated within a container along its main axis. It holds the *strategy* only: no layout engine, no rendering, no geometry math. The same value travels unchanged from the code that decides a layout to every layer that performs it.

```swift
import Position

// Pack items tight, or spread the slack between / around / evenly across them.
let compact: Distribution = .fill
let justified: Distribution = .spaceBetween
let breathing: Distribution = .spaceEvenly

// Three items, same container width, three results:
// .fill:         [A  B  C      ]   // minimum spacing, slack at the trailing edge
// .spaceBetween: [A     B     C]   // equal gaps, no space at the edges
// .spaceEvenly:  [  A   B   C  ]   // equal space everywhere, edges included

for distribution in Distribution.allCases {
    // .fill, then each Distribution.Space strategy wrapped in .space(_:)
    print(distribution)
}
```

The space strategies live in the nested `Distribution.Space` enum — `between` (gaps only between items), `around` (half-space at the edges), and `evenly` (uniform space throughout, edges included). The `spaceBetween` / `spaceAround` / `spaceEvenly` static accessors are `@inlinable` shorthands for the corresponding `.space(_:)` cases, so call sites stay flat.

```swift
import Position

func gaps(for distribution: Distribution) -> String {
    switch distribution {
    case .fill: "packed"
    case .space(.between): "between"
    case .space(.around): "around"
    case .space(.evenly): "evenly"
    }
}
```

`Distribution` is `Sendable`, `Hashable`, and `CaseIterable`; outside Embedded it is also `Codable`, so a chosen layout serializes and crosses process boundaries unchanged.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-position.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Position", package: "swift-position"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

One library product. Depends on no other package.

| Product | Target | Purpose |
|---------|--------|---------|
| `Position` | `Sources/Position/` | The `Distribution` axis-distribution enum (`fill`, `space(_:)`), its nested `Distribution.Space` strategy enum (`between`, `around`, `evenly`), and the `spaceBetween` / `spaceAround` / `spaceEvenly` convenience accessors. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
