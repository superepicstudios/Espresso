//
//  BoolRepresentable.swift
//  Espresso
//
//  Created by Mitch Treece on 6/28/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Protocol describing something that can be represented as a boolean.
public protocol BoolRepresentable {
    
    /// Gets a boolean representation.
    func asBool() -> Bool
}

// MARK: Bool

extension Bool: BoolRepresentable {
    public func asBool() -> Bool { self }
}

// MARK: Int

extension Int: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Int8: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Int16: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Int32: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Int64: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Int128: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt8: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt16: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt32: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt64: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension UInt128: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

// MARK: Float

extension Float: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Float16: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

extension Float64: BoolRepresentable {
    public func asBool() -> Bool { self > 0 }
}

// MARK: String

extension String: BoolRepresentable {
    public func asBool() -> Bool { self == Bool.trueString }
}
