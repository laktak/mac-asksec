// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AskSec",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(name: "asksec",
                    targets: ["AskSec"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "0.0.1")),
    ],
    targets: [
        .executableTarget(
            name: "AskSec",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
