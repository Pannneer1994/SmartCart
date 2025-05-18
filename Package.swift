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
            url: "https://github.com/SDWebImage/SDWebImage/releases/download/5.21.0/SDWebImage-dynamic.xcframework.zip",
            checksum: "e034ea04f5e86866bc3081d009941bd5b2a2ed705b3a06336656484514116638"
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
