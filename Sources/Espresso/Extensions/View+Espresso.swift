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

extension View {
    
    /// Positions this view within an invisible frame with the specified size.
    /// - parameter value: A fixed width & height value for the resulting view.
    /// - parameter alignment: The alignment of this view inside the resulting frame.
    ///   Note that most alignment values have no apparent effect when the size of the frame happens to match that of this view.
    /// - returns: A view with fixed dimensions of width and height.
    public func frame(
        widthAndHeight value: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: value,
            height: value,
            alignment: alignment
        )
    }
    
    /// Positions this view within an invisible frame with the specified size.
    /// - parameter size: A fixed size value for the resulting view.
    /// - parameter alignment: The alignment of this view inside the resulting frame.
    ///   Note that most alignment values have no apparent effect when the size of the frame happens to match that of this view.
    /// - returns: A view with a fixed size.
    public func frame(
        size: CGSize,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: size.width,
            height: size.height,
            alignment: alignment
        )
    }
    
    public func offset(point: CGPoint) -> some View {
        offset(
            x: point.x,
            y: point.y
        )
    }
    
    /// Adds an amount of padding over the safe area edge insets of this view.
    /// - parameter: edges: A set of edges to add padding to.
    /// - parameter length: An amount to pad the specified edges by.
    /// - returns: A view that applies padding over its safe area edge insets.
    public func paddingOverSafeArea(
        _ edges: Edge.Set,
        _ length: CGFloat
    ) -> some View {
        safeAreaPadding(edges)
            .padding(edges, length)
    }
}
