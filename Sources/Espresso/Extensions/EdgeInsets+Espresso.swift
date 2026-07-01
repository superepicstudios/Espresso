//
//  EdgeInsets+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 6/30/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

extension EdgeInsets {

    /// Empty edge insets.
    public static let zero: EdgeInsets = .init()

    // MARK: All

    /// Initializes all edges with a value.
    /// - parameter all: The edge inset value.
    public init(all: CGFloat) {
        self.init(
            top: all,
            leading: all,
            bottom: all,
            trailing: all
        )
    }

    /// Initializes all edges (except top) with a value.
    /// - parameter value: The edge inset value.
    public init(allExceptTop value: CGFloat) {
        self.init(
            top: 0,
            leading: value,
            bottom: value,
            trailing: value
        )
    }

    /// Initializes all edges (except bottom) with a value.
    /// - parameter value: The edge inset value.
    public init(allExceptBottom value: CGFloat) {
        self.init(
            top: value,
            leading: value,
            bottom: 0,
            trailing: value
        )
    }

    /// Initializes all edges (except leading) with a value.
    /// - parameter value: The edge inset value.
    public init(allExceptLeading value: CGFloat) {
        self.init(
            top: value,
            leading: 0,
            bottom: value,
            trailing: value
        )
    }

    /// Initializes all edges (except trailing) with a value.
    /// - parameter value: The edge inset value.
    public init(allExceptTrailing value: CGFloat) {
        self.init(
            top: value,
            leading: value,
            bottom: value,
            trailing: 0
        )
    }

    // MARK: Axis

    /// Initializes horizontal & vertical edges.
    /// - parameter horizontal: The horizontal value.
    /// - parameter vertical: The vertical value.
    public init(
        horizontal: CGFloat = .zero,
        vertical: CGFloat = .zero
    ) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }

    // MARK: Individual

    /// Initializes the top edge.
    /// - parameter value: The edge inset value.
    public init(top: CGFloat) {
        self.init(
            top: top,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
    }

    /// Initializes the bottom edge.
    /// - parameter value: The edge inset value.
    public init(bottom: CGFloat) {
        self.init(
            top: 0,
            leading: 0,
            bottom: bottom,
            trailing: 0
        )
    }

    /// Initializes the leading edge.
    /// - parameter value: The edge inset value.
    public init(leading: CGFloat) {
        self.init(
            top: 0,
            leading: leading,
            bottom: 0,
            trailing: 0
        )
    }

    /// Initializes the trailing edge.
    /// - parameter value: The edge inset value.
    public init(trailing: CGFloat) {
        self.init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: trailing
        )
    }

    // MARK: Representations

    /// Gets a ``HorizontalEdgeInsets`` representation.
    /// - returns: The ``EdgeInsets`` as ``HorizontalEdgeInsets``.
    public func asHorizontalEdgeInsets() -> HorizontalEdgeInsets {
        .init(
            leading: self.leading,
            trailing: self.trailing
        )
    }

    /// Gets a ``VerticalEdgeInsets`` representation.
    /// - returns: The ``EdgeInsets`` as ``VerticalEdgeInsets``.
    public func asVerticalEdgeInsets() -> VerticalEdgeInsets {
        .init(
            top: self.top,
            bottom: self.bottom
        )
    }
}
