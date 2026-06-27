//
//  MemoryAddress.swift
//  Espresso
//
//  Created by Mitch Treece on 6/27/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

/// A memory address representation over a struct or class.
public struct MemoryAddress<T> {
    
    /// The memory address's raw integer value.
    public let value: Int
    
    /// The memory address's string representation.
    public var string: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", self.value)
    }
    
    /// Initializes a memory address with a struct pointer.
    /// - parameter struct: A struct pointer.
    public init(struct: UnsafePointer<T>) {
        self.value = Int(bitPattern: `struct`)
    }
}

extension MemoryAddress where T: AnyObject {
    
    /// Initializes a memory address with a class.
    /// - parameter class: A class instance.
    public init(class: T) {
        self.value = unsafeBitCast(
            `class`,
            to: Int.self
        )
    }
}

extension MemoryAddress: CustomStringConvertible {
    public var description: String { self.string }
}
