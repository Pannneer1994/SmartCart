// swift-tools-version:5.9
// This Swift package requires Swift 5.9 or later.

import PackageDescription

let package = Package(
    name: "SmartCart",
    
    // MARK: - Products
    // This package exposes a library called "SmartCart" for external use.
    products: [
        .library(
            name: "SmartCart",
            targets: ["SmartCart"]),
    ],
    
    // MARK: - Targets
    // Targets define modules or test suites. They may depend on each other or on external products.
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "SDWebImage",
            url: "https://github.com/SDWebImage/SDWebImage/releases/download/5.20.0/SDWebImage-dynamic.xcframework.zip",
            checksum: "b5e9ed9a177eb3d5a1f8890ee7ded39d8e92ecd2d0e423223ce53adcaeb01615"
        ),
        
        // MARK: Main Target - SmartCart
        .target(
            name: "SmartCart",
            
            // Declaring dependency on the binary SDWebImage target.
            dependencies: ["SDWebImage"],
            
            // Process resource files located in the Resources folder.
            resources: [
                .process("Resources")
            ]
        ),
        
        // MARK: Test Target - Unit Tests
        .testTarget(
            name: "SmartCartTests",
            dependencies: ["SmartCart"]),
    ]
)

