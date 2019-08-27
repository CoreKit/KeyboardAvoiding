// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "KeyboardAvoiding",
    platforms: [
       .iOS(.v12),
    ],
    products: [
        .library(
            name: "KeyboardAvoiding",
            targets: ["KeyboardAvoiding"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "KeyboardAvoiding",
            dependencies: [],
            path: "./Sources"),
        .testTarget(
            name: "KeyboardAvoidingTests",
            dependencies: ["KeyboardAvoiding"]),
    ]
)