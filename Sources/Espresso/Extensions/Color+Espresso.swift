//
//  Color+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

extension Color {
    
    public static func dynamic(
        light: Color,
        dark: Color
    ) -> Color {
        PlatformColor.dynamic(
            light: light.platform,
            dark: dark.platform
        ).swift
    }
}
