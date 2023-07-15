// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CompassSwiftUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Compass",
            targets: ["Compass"]),
    ],
    targets: [
        .target(
            name: "Compass",
            dependencies: []),
    ]
)
