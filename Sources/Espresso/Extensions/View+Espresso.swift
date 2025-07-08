//
//  View+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/2/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

public import SwiftUI

extension View {
    
    /// Erases the view into an ``AnyView``.
    /// - returns: The view as a type-erased ``AnyView``.
    public func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
}
