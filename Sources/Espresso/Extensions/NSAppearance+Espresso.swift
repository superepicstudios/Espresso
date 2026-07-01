//
//  NSAppearance+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 6/27/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

#if canImport(AppKit)
import AppKit

extension NSAppearance {
    
    public var isDark: Bool {
        let match = self.bestMatch(from: [.aqua, .darkAqua])
        return (match == .darkAqua)
    }
}
#endif
