//
//  AnyColor.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public protocol AnyColor {
    var platform: PlatformColor { get }
    var swift: Color { get }
}

// MARK: PlatformColor

extension PlatformColor: AnyColor {
    
    public var platform: PlatformColor { self }
    
    public var swift: Color {
        #if os(iOS)
        Color(uiColor: self)
        #elseif os(macOS)
        Color(nsColor: self)
        #else
        fatalError("Platform not supported")
        #endif
    }
}

// MARK: Color

extension Color: AnyColor {
    
    public var swift: Color { self }
    
    public var platform: PlatformColor {
        PlatformColor(self)
    }
}
