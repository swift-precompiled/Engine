// swift-tools-version:5.9

import PackageDescription
import Foundation
import CompilerPluginSupport

let package = Package(
    name: "Engine",
    platforms: [
        .iOS("13.0"),
        .macCatalyst("13.0"),
        .macOS("10.15"),
        .tvOS("13.0"),
        .visionOS("1.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "Engine",
            targets: ["Engine_Aggregation"]
        ),
        .library(
            name: "EngineCore",
            targets: ["EngineCore_Aggregation"]
        ),
        .library(
            name: "EngineCoreC",
            targets: ["EngineCoreC_Aggregation"]
        ),
        .library(
            name: "EngineMacros",
            targets: ["EngineMacros_Aggregation"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-syntax",
            "509.0.0"..<"600.1.1"
        )
    ],
    targets: [
        .target(
            name: "Engine_Aggregation",
            dependencies: [.target(name: "Engine"), "EngineCore_Aggregation"]
        ),
        .binaryTarget(
            name: "Engine",
            url: "https://api.github.com/repos/swift-precompiled/Engine/releases/assets/215957531.zip",
            checksum: "18ce7eb08df701ba7fca22f4064c479eb0f488a7eb954c4b837b4c8669e4cef4"
        ),
        .target(
            name: "EngineCore_Aggregation",
            dependencies: [.target(name: "EngineCore"), "EngineCoreC_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineCore",
            url: "https://api.github.com/repos/swift-precompiled/Engine/releases/assets/215957532.zip",
            checksum: "6665106f470adcd2025a55e600971b217caeec3491f2332053f226e19e7a13b0"
        ),
        .target(
            name: "EngineCoreC_Aggregation",
            dependencies: [.target(name: "EngineCoreC")]
        ),
        .binaryTarget(
            name: "EngineCoreC",
            url: "https://api.github.com/repos/swift-precompiled/Engine/releases/assets/215957534.zip",
            checksum: "38f20fed9a44a564c89d5f981d9f7767cb9944141916529923c13205b50846ea"
        ),
        .target(
            name: "EngineMacros_Aggregation",
            dependencies: [
                .target(name: "EngineMacros"),
                "Engine_Aggregation",
                "EngineMacrosCore"
            ]
        ),
        .binaryTarget(
            name: "EngineMacros",
            url: "https://api.github.com/repos/swift-precompiled/Engine/releases/assets/215957535.zip",
            checksum: "fb211211c39e5c2b78dacde0f0292ba22e8a08fb95952ce73c2d86eda22c19c9"
        ),
        .macro(
            name: "EngineMacrosCore",
            dependencies: [
                .product(
                    name: "SwiftSyntaxMacros",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftCompilerPlugin",
                    package: "swift-syntax"
                )
            ],
            path: "Macros/EngineMacrosCore"
        )
    ]
)