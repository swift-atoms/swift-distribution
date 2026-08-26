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
            name: "Position Test Support",
            targets: ["Position Test Support"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Position"
        ),
        .target(
            name: "Position Test Support",
            dependencies: [
                "Position"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Positioning Tests",
            dependencies: [
                "Position",
                "Position Test Support",
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
