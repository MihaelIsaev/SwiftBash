// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftBash",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Bash", targets: ["Bash"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Bash", dependencies: []),
        .testTarget(name: "BashTests", dependencies: [
            .target(name: "Bash")
        ]),
    ]
)
