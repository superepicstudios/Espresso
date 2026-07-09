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

extension PlatformColor {
    
    public convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        let a, r, g, b: UInt64
        var int: UInt64 = 0
        
        Scanner(string: hex)
            .scanHexInt64(&int)
        
        switch hex.count {
        case 3:  (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17) // rgb (12-bit)
        case 6:  (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF) // rgb (24-bit)
        case 8:  (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF) // rgb (32-bit)
        default: (a, r, g, b) = (0, 0, 0, 0)
        }
        
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}
