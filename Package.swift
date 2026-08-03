// swift-tools-version:6.0.0

import PackageDescription
import Foundation
import CompilerPluginSupport

let package = Package(
    name: "Engine",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15"),
        .macCatalyst("13.0"),
        .tvOS("13.0"),
        .watchOS("6.0"),
        .visionOS("1.0")
    ],
    products: [
        .library(
            name: "Engine",
            targets: ["Engine_Aggregation"]
        ),
        .library(
            name: "EngineExtensions",
            targets: ["EngineExtensions_Aggregation"]
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
    targets: [
        .target(
            name: "Engine_Aggregation",
            dependencies: ["Engine", "EngineCore_Aggregation"]
        ),
        .binaryTarget(
            name: "Engine",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1-precompiled.1/Engine-ae5a2dbb77ed501104ff039c39fff57b09b89d530d84d779f0b677700c42b526.xcframework.zip",
            checksum: "ae5a2dbb77ed501104ff039c39fff57b09b89d530d84d779f0b677700c42b526"
        ),
        .target(
            name: "EngineExtensions_Aggregation",
            dependencies: ["EngineExtensions", "Engine_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineExtensions",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1-precompiled.1/EngineExtensions-25d87681e372399bf6211c5ce6dae7719785337fd483e25218abf1354b3529b6.xcframework.zip",
            checksum: "25d87681e372399bf6211c5ce6dae7719785337fd483e25218abf1354b3529b6"
        ),
        .target(
            name: "EngineCore_Aggregation",
            dependencies: ["EngineCore", "EngineCoreC_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineCore",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1-precompiled.1/EngineCore-9a3383295ada61b12e83cb51aacdc356297420d46ebe09cfc83c4a1c8fe0ef2f.xcframework.zip",
            checksum: "9a3383295ada61b12e83cb51aacdc356297420d46ebe09cfc83c4a1c8fe0ef2f"
        ),
        .target(
            name: "EngineCoreC_Aggregation",
            dependencies: ["EngineCoreC"]
        ),
        .binaryTarget(
            name: "EngineCoreC",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1-precompiled.1/EngineCoreC-bae174a40056d89fd4dea1abf9cddcafda65b367a08b45d948e807ccaa37d767.xcframework.zip",
            checksum: "bae174a40056d89fd4dea1abf9cddcafda65b367a08b45d948e807ccaa37d767"
        ),
        .target(
            name: "EngineMacros_Aggregation",
            dependencies: [
                "EngineMacros",
                "Engine_Aggregation",
                "EngineMacrosCore"
            ]
        ),
        .binaryTarget(
            name: "EngineMacros",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1-precompiled.1/EngineMacros-4ffe79dc38220d9ceb7a03f06b2e80f0ba52458747568a04b15cff9388604603.xcframework.zip",
            checksum: "4ffe79dc38220d9ceb7a03f06b2e80f0ba52458747568a04b15cff9388604603"
        ),
        .macro(
            name: "EngineMacrosCore",
            path: "Macros/EngineMacrosCore"
        )
    ]
)