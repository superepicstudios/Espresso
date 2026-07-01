//
//  PlatformColor.swift
//  Espresso
//
//  Created by Mitch Treece on 6/27/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

#if canImport(UIKit)
public import UIKit
public typealias PlatformColor = UIColor
#elseif canImport(AppKit)
public import AppKit
public typealias PlatformColor = NSColor
#endif

extension PlatformColor {
    
    public static func `in`(
        bundle: Bundle,
        name: String
    ) -> PlatformColor? {
        #if os(iOS)
        return UIColor(
            named: name,
            in: bundle,
            compatibleWith: nil
        )
        #elseif os(macOS)
        return NSColor(
            named: name,
            bundle: bundle
        )
        #else
        fatalError("Platform not supported")
        #endif
    }
    
    public static func dynamic(
        light: PlatformColor,
        dark: PlatformColor
    ) -> PlatformColor {
        #if os(iOS)
        return UIColor { traits in
            return traits.userInterfaceStyle == .dark ? dark : light
        }
        #elseif os(macOS)
        return NSColor(name: nil) { appearance in
            return appearance.isDark ? dark : light
        }
        #else
        fatalError("Platform not supported")
        #endif
    }
}
