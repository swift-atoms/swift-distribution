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
        .library(
            name: "Position",
            targets: ["Position"]
        ),
        .library(
            name: "Position Standard Library Integration",
            targets: ["Position Standard Library Integration"]
        ),
        .library(
            name: "Position Apple Foundation Integration",
            targets: ["Position Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Position",
            dependencies: []
        ),
        .target(
            name: "Position Standard Library Integration",
            dependencies: ["Position"]
        ),
        .target(
            name: "Position Apple Foundation Integration",
            dependencies: [
                "Position",
                "Position Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Position Tests",
            dependencies: [
                "Position",
                "Position Standard Library Integration",
            ],
            path: "Tests/Position Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
