//
//  PlatformFont.swift
//  Espresso
//
//  Created by Mitch Treece on 6/29/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

#if canImport(UIKit)
public import UIKit
public typealias PlatformFont = UIFont
#elseif canImport(AppKit)
public import AppKit
public typealias PlatformFont = NSFont
#endif

extension PlatformFont {
    
    public enum LoadError: Error {
        case notFound
        case invalidData
    }
    
    public static func load(url: URL) throws {
        guard FileManager.default.fileExists(atPath: url.absoluteString) else {
            throw LoadError.notFound
        }
        
        guard let provider = CGDataProvider(url: url as CFURL),
              let font = CGFont(provider) else
        {
            throw LoadError.invalidData
        }
                
        var cfError: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &cfError)
        
        if let error = cfError as? Error {
            throw error
        }
    }
    
    public static func load(
        name: String,
        ext: String = "ttf",
        subdirectory: String? = nil,
        in bundle: Bundle
    ) throws {
        guard let url = bundle.url(
            forResource: name,
            withExtension: ext,
            subdirectory: subdirectory
        ) else {
            throw LoadError.notFound
        }
        
        try load(url: url)
    }
    
    public static func loadAll(
        in bundle: Bundle,
        ext: String = "ttf",
        subdirectory: String? = nil
    ) {
        let urls = bundle.urls(
            forResourcesWithExtension: ext,
            subdirectory: subdirectory
        ) ?? []
        
        for url in urls {
            try? load(url: url)
        }
    }
}
