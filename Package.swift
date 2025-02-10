// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MewLoaders",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MewLoaders",
            targets: ["MewLoaders"]),
    ],
    targets: [
        .target(
            name: "MewLoaders"),
        .testTarget(
            name: "MewLoadersTests",
            dependencies: ["MewLoaders"]
        ),
    ]
)
