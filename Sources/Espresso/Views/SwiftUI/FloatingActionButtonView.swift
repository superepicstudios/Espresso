//
//  FloatingActionButtonView.swift
//  Espresso
//
//  Created by Mitch Treece on 7/6/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

public struct FloatingActionButtonView: View {
    
    private let backgroundStyle: BackgroundView.Style
    private let image: AnyImage
    private let imageColor: Color
    private let tapAction: () -> Void
    private let pressAction: (() -> Void)?
    
    public init(
        background: BackgroundView.Style = .glass(tint: .accentColor.opacity(0.2)),
        image: AnyImage,
        imageColor: Color = .black,
        onTap: @escaping () -> Void,
        onPress: (() -> Void)? = nil
    ) {
        self.backgroundStyle = background
        self.image = image
        self.imageColor = imageColor
        self.tapAction = onTap
        self.pressAction = onPress
    }
    
    public var body: some View {
        Button(action: self.tapAction) {
            ZStack {
                BackgroundView(
                    shape: .circle,
                    style: self.backgroundStyle
                )
                .clipShape(Circle()) // fix weird glass rect when transitioning
                
                self.image.swift
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(self.imageColor)
            }
            .contentShape(Circle())
            .onLongPressGesture {
                self.pressAction?()
            }
        }
        .buttonStyle(.plain)
    }
}
