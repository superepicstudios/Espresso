// swift-tools-version: 6.0

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "Espresso",
    platforms: [

        .iOS(.v18),
        .macOS(.v15)

    ],
    products: [
        
        .library(
            name: "Espresso",
            targets: ["Espresso"]
        )
        
    ],
    dependencies: [

        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            "509.0.0"..<"601.0.0"
        )

    ],
    targets: [

        .target(
            name: "Espresso",
            dependencies: [
                .target(name: "EspressoMacros")
            ],
            path: "Sources/Espresso",
            resources: []
        ),

        .testTarget(
            name: "EspressoTests",
            dependencies: ["Espresso"],
            path: "Sources/EspressoTests"
        ),

        .macro(
            name: "EspressoMacros",
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
            path: "Sources/EspressoMacros"
        ),

        .testTarget(
            name: "EspressoMacrosTests",
            dependencies: [

                .target(name: "EspressoMacros"),

                .product(
                    name: "SwiftSyntaxMacrosTestSupport",
                    package: "swift-syntax"
                )

            ],
            path: "Sources/EspressoMacrosTests"
        )

    ],
    swiftLanguageModes: [.v6]
)
