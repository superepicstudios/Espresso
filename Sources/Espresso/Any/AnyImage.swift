//
//  AnyImage.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import SFSafeSymbols
public import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public protocol AnyImage {
    var platform: PlatformImage { get }
    var swift: Image { get }
}

// MARK: PlatformImage

extension PlatformImage: AnyImage {
    
    public var platform: PlatformImage { self }
    
    public var swift: Image {
        #if os(iOS)
        Image(uiImage: self)
        #elseif os(macOS)
        Image(nsImage: self)
        #else
        fatalError("Platform not supported")
        #endif
    }
}

// MARK: Image

extension Image: @MainActor AnyImage {
    
    public var swift: Image { self }
    
    @MainActor
    public var platform: PlatformImage {
        guard let image = ImageRenderer(content: self).cgImage else {
            return PlatformImage()
        }
        return PlatformImage(cgImage: image)
    }
}

// MARK: SFSymbol

extension SFSymbol: AnyImage {
    
    public var platform: PlatformImage {
        PlatformImage(systemSymbol: self)
    }
    
    public var swift: Image {
        Image(systemSymbol: self)
    }
}

extension AnyImage where Self: SFSymbol {
    
    public func platform(variableValue value: Double) -> PlatformImage {
        PlatformImage(
            systemSymbol: self,
            variableValue: value,
            configuration: nil
        )
    }
    
    public func swift(variableValue value: Double) -> Image {
        Image(
            systemSymbol: self,
            variableValue: value
        )
    }
}
