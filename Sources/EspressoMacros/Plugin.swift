//
//  Plugin.swift
//  EspressoMacros
//
//  Created by Mitch Treece on 7/1/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SECommonMacrosPlugin: CompilerPlugin {

    let providingMacros: [Macro.Type] = [
        ChainableMacro.self
    ]
    
}
