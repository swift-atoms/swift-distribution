# Position

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Layout value types for Swift: a small vocabulary describing how remaining
space is distributed along an axis.

## Quick Start

```swift
import Position

let compact: Distribution = .fill
let justified: Distribution = .spaceBetween
let breathing: Distribution = .spaceEvenly

func name(of distribution: Distribution) -> String {
    switch distribution {
    case .fill: "fill"
    case .space(.between): "space between"
    case .space(.around): "space around"
    case .space(.evenly): "space evenly"
    }
}
```

`Distribution.Space` contains the `between`, `around`, and `evenly`
strategies. The `spaceBetween`, `spaceAround`, and `spaceEvenly` accessors keep
common call sites flat.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-position.git", branch: "main")
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

The package uses Swift tools 6.4 and declares Apple platform version 27.

## Products

| Product | Purpose |
|---------|---------|
| `Position` | Foundation-free `Distribution` and `Distribution.Space` values. |
| `Position Standard Library Integration` | `CaseIterable` and non-Embedded `Codable` conformances. |
| `Position Apple Foundation Integration` | Apple Foundation integration and the package's only Foundation dependency. |

The package has no external dependencies. The core product is suitable for
Embedded Swift; Codable is isolated behind `hasFeature(Embedded)` in the
standard-library integration target.

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
