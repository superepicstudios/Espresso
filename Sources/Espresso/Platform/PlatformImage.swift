//
//  PlatformImage.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

#if canImport(UIKit)
public import UIKit
public typealias PlatformImage = UIImage
#elseif canImport(AppKit)
public import AppKit
public typealias PlatformImage = NSImage
#endif
