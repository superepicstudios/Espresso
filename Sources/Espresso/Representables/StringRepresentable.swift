//
//  StringRepresentable.swift
//  Espresso
//
//  Created by Mitch Treece on 6/28/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Protocol describing something that can be represented as a string.
public protocol StringRepresentable {
    
    /// Gets a string representation.
    func asString() -> String
    
}

// MARK: String

extension String: StringRepresentable {
    
    public func asString() -> String {
        self
    }
    
}

// MARK: Bool

extension Bool: StringRepresentable {
    
    public func asString() -> String {
        self ? Self.trueString : Self.falseString
    }
    
}

// MARK: Int

extension Int: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Int8: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Int16: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Int32: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Int64: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Int128: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt8: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt16: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt32: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt64: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension UInt128: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

// MARK: Float

extension Float: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Float16: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}

extension Float64: StringRepresentable {
    
    public func asString() -> String {
        String(self)
    }
    
}
