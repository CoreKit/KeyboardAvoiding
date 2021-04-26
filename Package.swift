// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KeyboardAvoiding",
    platforms: [
       .iOS(.v12),
    ],
    products: [
        .library(name: "KeyboardAvoiding", targets: ["KeyboardAvoiding"]),
    ],
    targets: [
        .target(name: "KeyboardAvoiding"),
    ]
)
