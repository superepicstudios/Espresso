//
//  OptionalRepresentable.swift
//  Espresso
//
//  Created by Mitch Treece on 5/12/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Protocol describing something that can be represented as an optional.
public protocol OptionalRepresentable {
    
    associatedtype Wrapped
    
    /// The optional's wrapped value.
    var wrappedValue: Wrapped? { get }
}

extension Optional: OptionalRepresentable {
    public var wrappedValue: Wrapped? { self }
}
