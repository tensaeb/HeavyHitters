// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "HeavyHitters",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.115.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        // 🔵 Non-blocking, event-driven networking for Swift. Used for custom executors
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0")
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio")
            ],
            swiftSettings: swiftSettings
        ),
//        .testTarget(
//            name: "HeavyHittersTests",
//            dependencies: [
//                .target(name: "HeavyHitters"),
//                .product(name: "VaporTesting", package: "vapor"),
//            ],
//            swiftSettings: swiftSettings
//        )
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
] }
