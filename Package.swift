// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "4.11.0"
let checksum = "4b1e76f3d1ce19369ff7e151d1c564926b4d23b5515c62fc65517dfd395c3929"

let package = Package(
    name: "PackageIO",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PackageIO",
            targets: ["PackageIO"]),
    ],
    dependencies: [
        // Add CocoaLumberjack dependency
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.5"),
        // Add SwiftLint dependency
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PackageIO",
            dependencies :[
                "CocoaLumberjack",
                //"IOWrapperKit"
            ],
            path: "Sources/PackageIO"
        ),
        //        .binaryTarget(
        //            name: "IOWrapperKit",
        //            path: "./Frameworks/IOWrapperKit.xcframework"
        //        ),
            .binaryTarget(name: "opencv2",
                          url: "https://github.com/yeatse/opencv-spm/releases/download/\(version)/opencv2.xcframework.zip",
                          checksum: checksum),
        .testTarget(
            name: "PackageIOTests",
            dependencies: ["PackageIO"]
        ),
    ]
)
