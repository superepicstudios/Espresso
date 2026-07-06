//
//  Bundle+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/4/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

extension Bundle {
    
    /// The bundle's version string.
    public var versionString: String? {
        self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// The bundle's build string.
    public var buildString: String? {
        self.infoDictionary?["CFBundleVersion"] as? String
    }
}
