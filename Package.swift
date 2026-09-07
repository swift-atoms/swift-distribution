// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-position",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Position", targets: ["Position"]),
        .library(name: "Position Standard Library Integration", targets: ["Position Standard Library Integration"]),
        .library(name: "Position Foundation Library Integration", targets: ["Position Foundation Library Integration"]),
        .library(name: "Position Test Support", targets: ["Position Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Position",
            dependencies: [
            ],
            path: "Sources/Position"
        ),
        .target(
            name: "Position Standard Library Integration",
            dependencies: [
                .target(name: "Position"),
            ],
            path: "Sources/Position Standard Library Integration"
        ),
        .target(
            name: "Position Foundation Library Integration",
            dependencies: [
                .target(name: "Position"),
                .target(name: "Position Standard Library Integration"),
            ],
            path: "Sources/Position Foundation Library Integration"
        ),
        .target(
            name: "Position Test Support",
            dependencies: [
                .target(name: "Position"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Position Tests",
            dependencies: [
                .target(name: "Position"),
                .target(name: "Position Test Support"),
                .target(name: "Position Standard Library Integration"),
                .target(name: "Position Foundation Library Integration"),
            ],
            path: "Tests/Position Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
