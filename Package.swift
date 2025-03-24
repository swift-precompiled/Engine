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
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.2/Engine.xcframework.zip",
            checksum: "58cf6f5ac4d38f35a90c2c54a1bdbb3aa4468c9927c88f5fcfb8fbb219e88ba8"
        ),
        .target(
            name: "EngineCore_Aggregation",
            dependencies: [.target(name: "EngineCore"), "EngineCoreC_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineCore",
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.2/EngineCore.xcframework.zip",
            checksum: "d8a32a7e8a907325ea66c878c4f8cf8456d60b1c39859d5fe7cc61386aafc27b"
        ),
        .target(
            name: "EngineCoreC_Aggregation",
            dependencies: [.target(name: "EngineCoreC")]
        ),
        .binaryTarget(
            name: "EngineCoreC",
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.2/EngineCoreC.xcframework.zip",
            checksum: "1078d0cb0c2c98d4cff19fadbb3c54a05c767bb95fa84c098951dc5b0e48697e"
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
            url: "https://github.com/swift-precompiled/Engine/releases/download/1.9.2/EngineMacros.xcframework.zip",
            checksum: "9477dc8bce26f499eab0e33f6ebb397bd07ac483e5599bc26a9f2cc015f51e66"
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