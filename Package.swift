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
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.3/Engine.xcframework.zip",
            checksum: "08ba47a4f257e714d32f0d3c97f20462bdd45ce286d8b096758838442ec56d02"
        ),
        .target(
            name: "EngineCore_Aggregation",
            dependencies: [.target(name: "EngineCore"), "EngineCoreC_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineCore",
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.3/EngineCore.xcframework.zip",
            checksum: "aa271dc843e89aa4046825dcf0563bf8536170d56f51a03c89e8d94a76ec6298"
        ),
        .target(
            name: "EngineCoreC_Aggregation",
            dependencies: [.target(name: "EngineCoreC")]
        ),
        .binaryTarget(
            name: "EngineCoreC",
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.3/EngineCoreC.xcframework.zip",
            checksum: "2ba38a9b89e8b0482f38f0f3443064aadbd754dc7bb55e480641fde058832480"
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
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.3/EngineMacros.xcframework.zip",
            checksum: "e0e982c88eaa65499c75e98a10935a57e7c9728772fa888fdcf704b24aeabc1c"
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