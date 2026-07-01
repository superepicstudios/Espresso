//
//  VerticalEdgeInsets.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

/// The inset distances for the vertical sides of a rectangle.
public struct VerticalEdgeInsets: Sendable {

    /// A top inset value.
    public let top: CGFloat

    /// A bottom inset value.
    public let bottom: CGFloat

    /// Empty vertical edge insets.
    public static let zero: Self = .init(top: 0, bottom: 0)

    /// Initializes vertical edge insets.
    /// - parameter top: A top inset value.
    /// - parameter bottom: A bottom inset value.
    public init(
        top: CGFloat,
        bottom: CGFloat
    ) {
        self.top = top
        self.bottom = bottom
    }

    /// Gets an ``EdgeInsets`` representation.
    /// - returns: The ``VerticalEdgeInsets`` as ``EdgeInsets``.
    public func asEdgeInsets() -> EdgeInsets {
        .init(
            top: self.top,
            leading: 0,
            bottom: self.bottom,
            trailing: 0
        )
    }
}
