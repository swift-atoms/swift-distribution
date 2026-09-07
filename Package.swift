// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-distribution",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Distribution", targets: ["Distribution"]),
        .library(name: "Distribution Standard Library Integration", targets: ["Distribution Standard Library Integration"]),
        .library(name: "Distribution Foundation Library Integration", targets: ["Distribution Foundation Library Integration"]),
        .library(name: "Distribution Test Support", targets: ["Distribution Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Distribution",
            dependencies: [
            ],
            path: "Sources/Distribution"
        ),
        .target(
            name: "Distribution Standard Library Integration",
            dependencies: [
                .target(name: "Distribution"),
            ],
            path: "Sources/Distribution Standard Library Integration"
        ),
        .target(
            name: "Distribution Foundation Library Integration",
            dependencies: [
                .target(name: "Distribution"),
                .target(name: "Distribution Standard Library Integration"),
            ],
            path: "Sources/Distribution Foundation Library Integration"
        ),
        .target(
            name: "Distribution Test Support",
            dependencies: [
                .target(name: "Distribution"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Distribution Tests",
            dependencies: [
                .target(name: "Distribution"),
                .target(name: "Distribution Test Support"),
                .target(name: "Distribution Standard Library Integration"),
                .target(name: "Distribution Foundation Library Integration"),
            ],
            path: "Tests/Distribution Tests"
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
