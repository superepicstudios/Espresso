//
//  Line.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

/// A horizontal line shape.
public struct HLine: Shape {
    
    /// Initializes a horizontal line shape.
    public init() {}
    
    public nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: .init(x: rect.width, y: 0))
        return path
    }
}

/// A vertical line shape.
public struct VLine: Shape {
    
    /// Initializes a vertical line shape.
    public init() {}
    
    public nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: .init(x: 0, y: rect.height))
        return path
    }
}
