// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmartCart",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SmartCart",
            targets: ["SmartCart"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "SDWebImage",
            url: "https://github.com/SDWebImage/SDWebImage/releases/download/5.21.0/SDWebImage-static.xcframework.zip",
            checksum: "cd8185cfd36836797327b7a11b65584100f86edb7878658e82db363ac02877a6"
        ),
        .target(
            name: "SmartCart",
            dependencies: ["SDWebImage"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SmartCartTests",
            dependencies: ["SmartCart"]),
    ]
)
