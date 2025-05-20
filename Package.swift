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
            targets: ["SmartCart"]
        )
    ],
    
    // MARK: - Targets
    // Targets define modules or test suites. They may depend on each other or on external products.
    targets: [
        
        // MARK: Binary Dependency (SDWebImage)
        // This binary target integrates SDWebImage as a dynamic xcframework.
        .binaryTarget(
            name: "SDWebImage",
            url: "https://github.com/SDWebImage/SDWebImage/releases/download/5.21.0/SDWebImage-dynamic.xcframework.zip",
            checksum: "e034ea04f5e86866bc3081d009941bd5b2a2ed705b3a06336656484514116638"
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
            dependencies: ["SmartCart"]
        )
    ]
)

