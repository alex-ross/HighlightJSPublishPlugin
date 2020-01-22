// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HighlightJSPublishPlugin",
    products: [
        .library(
            name: "HighlightJSPublishPlugin",
            targets: ["HighlightJSPublishPlugin"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/johnsundell/publish.git",
            from: "0.3.0"
        ),
    ],
    targets: [
        .target(
            name: "HighlightJSPublishPlugin",
            dependencies: ["HighlightJS", "Publish"]
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
