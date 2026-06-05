// swift-tools-version: 6.3

import CompilerPluginSupport
@preconcurrency import PackageDescription

let package = Package(
    name: "Espresso",
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
    ],
    products: [
        .library(for: .espresso)
    ],
    dependencies: [
        .swiftSyntax
    ],
    targets: [
        .espresso, .unitTests(for: .espresso),
        .espressoMacros, .unitTests(for: .espressoMacros)
    ],
    swiftLanguageModes: [.v6]
)

// MARK: Packages

extension Package.Dependency {
    static let swiftSyntax: Package.Dependency = .package(
        url: "https://github.com/swiftlang/swift-syntax.git",
        from: "600.0.0"
    )
}

// MARK: Targets

extension Target {

    static let espresso: Target = .target(
        name: "Espresso",
        dependencies: [
            "EspressoMacros"
        ],
        swiftSettings: .default
    )

    static let espressoMacros: Target = .macro(
        name: "EspressoMacros",
        dependencies: [
            .swiftSyntax,
            .swiftSyntaxMacros,
            .swiftCompilerPlugin
        ],
        swiftSettings: .default
    )

    static func unitTests(
        for target: Target,
        additionalDependencies: [Target.Dependency] = [],
        resources: [Resource] = []
    ) -> Target {
        .testTarget(
            name: "\(target.name)Tests",
            dependencies: [.target(name: target.name)] + additionalDependencies,
            resources: resources
        )
    }
}

extension Target.Dependency {

    static let swiftCompilerPlugin: Target.Dependency = .product(
        name: "SwiftCompilerPlugin",
        package: "swift-syntax"
    )

    static let swiftSyntax: Target.Dependency = .product(
        name: "SwiftSyntax",
        package: "swift-syntax"
    )

    static let swiftSyntaxMacros: Target.Dependency = .product(
        name: "SwiftSyntaxMacros",
        package: "swift-syntax"
    )
}

// MARK: Product

extension Product {
    static func library(
        for target: Target,
        type: Library.LibraryType? = nil
    ) -> Product {
        .library(
            name: target.name,
            type: type,
            targets: [target.name]
        )
    }
}

// MARK: Settings

extension SwiftSetting {

    /// Force the use of the `any` keyword for existential types.
    /// See [#0335](https://github.com/apple/swift-evolution/blob/main/proposals/0335-existential-any.md) for more details.
    static let existentialAny: SwiftSetting = .enableUpcomingFeature("ExistentialAny")

    /// Import declarations scoped to `internal` by default.
    /// See [#0409](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0409-access-level-on-imports.md) for more details.
    static let internalImports: SwiftSetting = .enableUpcomingFeature("InternalImportsByDefault")
}

extension [SwiftSetting] {
    static let `default`: [SwiftSetting] = [
        .existentialAny,
        .internalImports
    ]
}
