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

        .library(name: "Distribution Foundation Integration", targets: ["Distribution Foundation Integration"]),
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
            name: "Distribution Foundation Integration",
            dependencies: [
                .target(name: "Distribution"),
            ],
            path: "Sources/Distribution Foundation Integration"
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
            ],
            path: "Tests/Distribution Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
