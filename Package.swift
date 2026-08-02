// swift-tools-version:6.0.0

import PackageDescription
import Foundation
import CompilerPluginSupport

let package = Package(
    name: "source",
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
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1/Engine-93953cf8cb4800265cb9f108a9faaa53bb39a718eba99273914e664e62b78748.xcframework.zip",
            checksum: "93953cf8cb4800265cb9f108a9faaa53bb39a718eba99273914e664e62b78748"
        ),
        .target(
            name: "EngineExtensions_Aggregation",
            dependencies: ["EngineExtensions", "Engine_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineExtensions",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1/EngineExtensions-1976b9c89ee8f2da64e975bba41a0454208c2164b650b32bd20a34c59a86b9b6.xcframework.zip",
            checksum: "1976b9c89ee8f2da64e975bba41a0454208c2164b650b32bd20a34c59a86b9b6"
        ),
        .target(
            name: "EngineCore_Aggregation",
            dependencies: ["EngineCore", "EngineCoreC_Aggregation"]
        ),
        .binaryTarget(
            name: "EngineCore",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1/EngineCore-a18aa0ce55b60cd983c911153c72b25ff088f2db5edc442b92b7a77215820e25.xcframework.zip",
            checksum: "a18aa0ce55b60cd983c911153c72b25ff088f2db5edc442b92b7a77215820e25"
        ),
        .target(
            name: "EngineCoreC_Aggregation",
            dependencies: ["EngineCoreC"]
        ),
        .binaryTarget(
            name: "EngineCoreC",
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1/EngineCoreC-c1fc6a9a949381b941be6c72f4145037654aa3fc2618e65e4fa15ec817171e08.xcframework.zip",
            checksum: "c1fc6a9a949381b941be6c72f4145037654aa3fc2618e65e4fa15ec817171e08"
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
            url: "https://github.com/swift-precompiled/Engine/releases/download/2.13.1/EngineMacros-96c43aee3dd83475310e7b648e77a77b98c7fc5cf539a0d56d7e714aa3363e4c.xcframework.zip",
            checksum: "96c43aee3dd83475310e7b648e77a77b98c7fc5cf539a0d56d7e714aa3363e4c"
        ),
        .macro(
            name: "EngineMacrosCore",
            path: "Macros/EngineMacrosCore"
        )
    ]
)