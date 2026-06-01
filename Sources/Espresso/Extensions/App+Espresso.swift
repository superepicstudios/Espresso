//
//  App+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 6/27/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

public import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension App {
    
    /// The application's bundle identifier _(CFBundleIdentifier)_.
    public var bundleId: String? {
        #if canImport(UIKit)
        UIApplication.shared.bundleId
        #elseif canImport(AppKit)
        NSApplication.shared.bundleId
        #endif
    }

    /// The application's version string _(CFBundleShortVersionString)_.
    public var version: String? {
        #if canImport(UIKit)
        UIApplication.shared.bundleVersion
        #elseif canImport(AppKit)
        NSApplication.shared.bundleVersion
        #endif
    }

    /// The application's build number string _(CFBundleVersion)_.
    public var build: String? {
        #if canImport(UIKit)
        UIApplication.shared.bundleBuild
        #elseif canImport(AppKit)
        NSApplication.shared.bundleBuild
        #endif
    }
}
