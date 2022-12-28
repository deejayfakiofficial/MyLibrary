// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "MyLibrary", targets: ["MyLibrary"])
    ],
    dependencies: [
        .package(url: "https://github.com/slackhq/PanModal.git", branch: "master"),
    ],
    targets: [
        .target(name: "MyLibrary", dependencies: ["PanModal"])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
