//
//  KeyProtocol.swift
//  Espresso
//
//  Created by Mitch Treece on 6/28/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Protocol describing a unique key.
public protocol KeyProtocol {
    
    /// The key's string value.
    var value: String { get }
    
}

extension KeyProtocol where Self: RawRepresentable, RawValue == String {
    
    public var value: String {
        return self.rawValue
    }
    
}
