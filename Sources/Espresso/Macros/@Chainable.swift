//
//  @Chainable.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// A macro that generates chainable setter functions for variables.
///
/// ```swift
/// struct Container {
///     @Chainable var value = 0
/// }
///
/// let container = Container()
///
/// container
///     .setValue(1)
///     .setValue(2)
///     .setValue(3)
/// ```
@attached(peer, names: arbitrary)
public macro Chainable() = #externalMacro(
    module: "EspressoMacros",
    type: "ChainableMacro"
)
