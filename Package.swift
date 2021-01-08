// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swifty-Extensions",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "Swifty-Extensions", targets: ["Swifty-Extensions"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Swifty-Extensions", dependencies: [], path: "Sources")
    ],
    swiftLanguageVersions: [
        .version("5")
    ]
)
