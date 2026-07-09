//
//  NavigationActionLink.swift
//  Espresso
//
//  Created by Mitch Treece on 7/4/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

/// A view that manages a navigation action.
public struct NavigationActionLink<Label: View>: View {
    
    private let isLinkIndicatorVisible: Bool
    private let label: ()->Label
    private let action: ()->()

    /// Initializes a navigation action link.
    /// - parameter indicator: Flag indicating if the link indicator should be visible.
    /// - parameter action: The action to perform.
    /// - parameter label: The label view builder.
    public init(
        indicator: Bool = true,
        action: @escaping ()->(),
        @ViewBuilder label: @escaping ()->Label
    ) {
        self.label = label
        self.action = action
        self.isLinkIndicatorVisible = indicator
    }
    
    /// Initializes a navigation action link.
    /// - parameter title: The link's title.
    /// - parameter indicator: Flag indicating if the link indicator should be visible.
    /// - parameter action: The action to perform.
    public init(
        _ title: String,
        indicator: Bool = true,
        action: @escaping ()->()
    ) where Label == Text {
        self.label = { Text(title) }
        self.action = action
        self.isLinkIndicatorVisible = indicator
    }
    
    /// Initializes a navigation action link.
    /// - parameter title: The link's title.
    /// - parameter image: The name of the link's icon image.
    /// - parameter indicator: Flag indicating if the link indicator should be visible.
    /// - parameter action: The action to perform.
    public init(
        _ title: String,
        image: String,
        indicator: Bool = true,
        action: @escaping ()->()
    ) where Label == SwiftUI.Label<Text, Image> {
        self.label = { SwiftUI.Label(title, image: image) }
        self.action = action
        self.isLinkIndicatorVisible = indicator
    }
    
    /// Initializes a navigation action link.
    /// - parameter title: The link's title.
    /// - parameter systemImage: The name of the link's system icon image.
    /// - parameter indicator: Flag indicating if the link indicator should be visible.
    /// - parameter action: The action to perform.
    public init(
        _ title: String,
        systemImage: String,
        indicator: Bool = true,
        action: @escaping ()->()
    ) where Label == SwiftUI.Label<Text, Image> {
        self.label = { SwiftUI.Label(title, systemImage: systemImage) }
        self.action = action
        self.isLinkIndicatorVisible = indicator
    }
    
    /// Initializes a navigation action link.
    /// - parameter title: The link's title.
    /// - parameter symbol: The link's icon symbol.
    /// - parameter indicator: Flag indicating if the link indicator should be visible.
    /// - parameter action: The action to perform.
    public init(
        _ title: String,
        symbol: SFSymbol,
        indicator: Bool = true,
        action: @escaping ()->()
    ) where Label == SwiftUI.Label<Text, Image> {
        self.init(
            title,
            systemImage: symbol.rawValue,
            indicator: indicator,
            action: action
        )
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                self.label()
                Spacer()
                NavigationLink(
                    destination: EmptyView(),
                    label: { EmptyView() }
                )
                .opacity(self.isLinkIndicatorVisible ? 1 : 0)
                .layoutPriority(-1)
            }
        }
    }
}
