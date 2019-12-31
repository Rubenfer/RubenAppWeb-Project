// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Rubenappweb",
    products: [
        .executable(name: "Rubenappweb", targets: ["Rubenappweb"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Rubenappweb",
            dependencies: ["Publish"]
        )
    ]
)