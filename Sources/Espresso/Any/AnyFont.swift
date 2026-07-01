//
//  AnyFont.swift
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

public protocol AnyFont {
    var platform: PlatformFont { get }
    var swift: Font { get }
}

// MARK: PlatformFont

extension PlatformFont: AnyFont {
    public var platform: PlatformFont { self }
    public var swift: Font { Font(self) }
}

// MARK: Font

extension Font: AnyFont {
    
    public var swift: Font { self }
    
    public var platform: PlatformFont {
        
        let fontMirror = Mirror(reflecting: self)
        let fallback: PlatformFont = .preferredFont(forTextStyle: .body)
        
        guard let provider = fontMirror.descendant("provider", "base") else {
            return fallback
        }
        
        let providerMirror = Mirror(reflecting: provider)
        
        if let ctFont = providerMirror.descendant("ctFont"), let platformFont = ctFont as? PlatformFont {
            return platformFont
        }
        
        return fallback
    }
}
