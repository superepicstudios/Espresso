//
//  BundleInfoProviding.swift
//  Espresso
//
//  Created by Mitch Treece on 7/7/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Protocol describing something that provides bundle information.
public protocol BundleInfoProviding {}

extension BundleInfoProviding {
    
    /// The bundle's identifier _(CFBundleIdentifier)_.
    public var bundleId: String? {
        Bundle.main.bundleIdentifier
    }
    
    /// The bundle's version string _(CFBundleShortVersionString)_.
    public var bundleVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// The bundle's build number string _(CFBundleVersion)_.
    public var bundleBuild: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}

#if canImport(UIKit)
import UIKit
extension UIApplication: BundleInfoProviding {}
#elseif canImport(AppKit)
import AppKit
extension NSApplication: BundleInfoProviding {}
#endif
