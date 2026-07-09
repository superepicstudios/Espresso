//
//  BackgroundView.swift
//  Espresso
//
//  Created by Mitch Treece on 7/6/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

public struct BackgroundView: View {
    
    private let shape: Shape
    private let style: Style
    
    public init(
        shape: Shape = .rect,
        style: Style = .color(.primary)
    ) {
        self.shape = shape
        self.style = style
    }
    
    public var body: some View {
        switch self.style {
        case let .color(color):
            self.shape.swiftShape
                .fill(color)
                .eraseToAnyView()
        case let .gradient(colors, start, end):
            self.shape.swiftShape
                .fill(LinearGradient(
                    colors: colors,
                    startPoint: start,
                    endPoint: end
                ))
                .eraseToAnyView()
        case let .glass(tint):
            if #available(iOS 26, *) {
                self.shape.swiftShape
                    .fill(tint)
                    .glassEffect()
                    .eraseToAnyView()
            } else {
                self.shape.swiftShape
                    .fill(tint)
                    .eraseToAnyView()
            }
        }
    }
}

// MARK: Shape

extension BackgroundView {
    
    public enum Shape {
        
        case rect
        case roundedRect(CGFloat)
        case capsule
        case circle
        
        var swiftShape: any SwiftUI.Shape {
            switch self {
            case .rect: Rectangle()
            case let .roundedRect(radius): RoundedRectangle(cornerRadius: radius)
            case .capsule: Capsule()
            case .circle: Circle()
            }
        }
    }
}

// MARK: Style

extension BackgroundView {
    
    public enum Style {
        
        case color(Color)
        
        case gradient(
            colors: [Color],
            start: UnitPoint,
            end: UnitPoint
        )
        
        case glass(tint: Color)
    }
}
