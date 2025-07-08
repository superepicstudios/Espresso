//
//  DefaultValueProviding.swift
//  Espresso
//
//  Created by Mitch Treece on 6/22/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

public import Foundation

/// Protocol describing something that can provide a default value.
public protocol DefaultValueProviding {
    
    /// The type's default value.
    static var defaultValue: Self { get }

}

// MARK: Bool

extension Bool: DefaultValueProviding {
    public static var defaultValue: Bool { false }
}

// MARK: Int

extension Int: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension Int8: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension Int16: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension Int32: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension Int128: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension UInt: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension UInt8: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension UInt16: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension UInt32: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension UInt128: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

// MARK: Float

extension Float: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension Float16: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

// MARK: Double

extension Double: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

// MARK: String

extension String: DefaultValueProviding {
    public static var defaultValue: Self { "" }
}

// MARK: Collections

extension Array: DefaultValueProviding {
    public static var defaultValue: Array<Element> { [] }
}

extension Set: DefaultValueProviding {
    public static var defaultValue: Set<Element> { [] }
}

extension Dictionary: DefaultValueProviding {
    public static var defaultValue: Dictionary<Key, Value> { [:] }
}

// MARK: Platform

extension CGFloat: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}

extension CGVector: DefaultValueProviding {
    public static var defaultValue: Self { .init() }
}

extension CGPoint: DefaultValueProviding {
    public static var defaultValue: Self { .init() }
}

extension CGSize: DefaultValueProviding {
    public static var defaultValue: Self { .init() }
}

extension CGRect: DefaultValueProviding {
    public static var defaultValue: Self { .init() }
}

extension NSNumber: DefaultValueProviding {
    public static var defaultValue: Self { 0 }
}
