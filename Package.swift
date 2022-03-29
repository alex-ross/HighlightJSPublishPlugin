// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HighlightJSPublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "HighlightJSPublishPlugin",
            targets: ["HighlightJSPublishPlugin"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/johnsundell/publish.git",
            branch: "swift-concurrency"
        ),
    ],
    targets: [
        .target(
            name: "HighlightJSPublishPlugin",
            dependencies: ["HighlightJS", .product(name: "Publish", package: "publish")]
        ),
        .testTarget(
            name: "HighlightJSPublishPluginTests",
            dependencies: ["HighlightJSPublishPlugin"]
        ),
        .target(name: "HighlightJS"),
        .testTarget(
            name: "HighlightJSTests",
            dependencies: ["HighlightJS"]
        ),
    ]
)
