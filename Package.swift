// swift-tools-version: 6.0
//
// StackQLMCP: run an embedded StackQL MCP server from a binary located on
// disk (app bundle resource, shared cache, or download), spawned over stdio
// and returned as a connected MCP client.
//
// The single external dependency is the official MCP Swift SDK, which sets
// the floors: Swift 6.0 (Xcode 16) and macOS 13. The project CLAUDE.md
// mentions Swift 5.10+, but the SDK requires 6.0, so that is the effective
// minimum.

import PackageDescription

let package = Package(
    name: "StackQLMCP",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(name: "StackQLMCP", targets: ["StackQLMCP"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/modelcontextprotocol/swift-sdk.git",
            from: "0.11.0"
        )
    ],
    targets: [
        .target(
            name: "StackQLMCP",
            dependencies: [
                .product(name: "MCP", package: "swift-sdk")
            ]
        ),
        .testTarget(
            name: "StackQLMCPTests",
            dependencies: ["StackQLMCP"]
        )
    ]
)
