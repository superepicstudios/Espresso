//
//  None.swift
//  Espresso
//
//  Created by Mitch Treece on 6/28/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// A `nil` representation over a type.
public struct None<T> {
    
    /// The type's `nil` value.
    public static var value: T? { nil }
    
    /// Initializes a `None`.
    public init() {}
}

extension None: Sendable where T: Sendable {}
