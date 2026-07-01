//
//  HorizontalEdgeInsets.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

/// The inset distances for the horizontal sides of a rectangle.
public struct HorizontalEdgeInsets: Sendable {

    /// A leading inset value.
    public let leading: CGFloat

    /// A trailing inset value.
    public let trailing: CGFloat

    /// Empty horizontal edge insets.
    public static let zero: Self = .init(leading: 0, trailing: 0)

    /// Initializes horizontal edge insets.
    /// - parameter leading: A leading inset value.
    /// - parameter trailing: A trailing inset value.
    public init(
        leading: CGFloat,
        trailing: CGFloat
    ) {
        self.leading = leading
        self.trailing = trailing
    }

    /// Gets an ``EdgeInsets`` representation.
    /// - returns: The ``HorizontalEdgeInsets`` as ``EdgeInsets``.
    public func asEdgeInsets() -> EdgeInsets {
        .init(
            top: 0,
            leading: self.leading,
            bottom: 0,
            trailing: self.trailing
        )
    }
}
