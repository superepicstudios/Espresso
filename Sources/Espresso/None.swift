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
    
    public static var value: T? { nil }
    
    private init() {}
    
}

extension None: Sendable where T: Sendable {}
