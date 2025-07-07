//
//  ChainableMacro.swift
//  EspressoMacros
//
//  Created by Mitch Treece on 7/1/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct ChainableMacro: PeerMacro {
    
    static let macroName = "Chainable"

    public enum Error: Swift.Error, CustomStringConvertible {

        case nonVariable
        case immutable
        case invalidDeclaration
        case missingType

        public var description: String {
            switch self {
            case .nonVariable: "\(macroName): Can only be applied to variables."
            case .immutable: "\(macroName): Can only be applied to mutable properties. Change `let` to `var`."
            case .invalidDeclaration: "\(macroName): Property is not properly declared."
            case .missingType: "\(macroName): Property declaration is missing a type."
            }
        }
    }

    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [DeclSyntax] {

        guard let variable = declaration.as(VariableDeclSyntax.self) else {
            throw Error.nonVariable
        }

        guard variable.bindingSpecifier.text == "var" else {
            throw Error.immutable
        }

        guard let binding = variable.bindings.first,
              let identifier = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier else {
            throw Error.invalidDeclaration
        }

        guard let type = binding.typeAnnotation else {
            throw Error.missingType
        }
        
        var accessLevel: String?
        
        for modifier in variable.modifiers {
            
            let name = modifier.trimmed.name.text
            let modifiers: Set<String> = ["public", "package", "internal", "private"]
            
            if modifiers.contains(name) {
                accessLevel = "\(name) "
                break
            }
            
        }
        
        let variableName = identifier.text
        let typeName = type.description.replacingOccurrences(of: " ", with: "")
        
        let output = """
        @discardableResult
        \(accessLevel != nil ? accessLevel! : "")func \(variableName)(_ value\(typeName)) -> Self {
            self.\(variableName) = value
            return self
        }
        """
        
        return [DeclSyntax(stringLiteral: output)]
        
    }
    
}
