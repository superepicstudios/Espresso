//
//  FloatingTabView.swift
//  Espresso
//
//  Created by Mitch Treece on 7/6/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

public protocol FloatingTabItem: Identifiable where Self.ID == Int {
    var title: String? { get }
    var image: AnyImage { get }
    var selectedColor: Color { get }
    var deselectedColor: Color { get }
}

public struct FloatingTabView<Item: FloatingTabItem>: View {
    
    struct Layout {
        let barSize: CGSize
        let itemSize: CGSize
        let selectionBubbleSize: CGSize
        let selectionBubbleOffsetX: CGFloat
        let selectionBubblePosition: CGPoint
        let selectionBubbleScale: CGFloat
    }
    
    public static var height: CGFloat { 66 }
    
    @Binding var selectedItem: Item
    private let items: [Item]
    private let backgroundStyle: BackgroundView.Style
    private let selectionBubbleBackgroundStyle: BackgroundView.Style
    private let selectionBubbleInset: CGFloat = 8

    @State private var selectionBubbleDragOffsetX: CGFloat?
    @State private var selectionBubbleIsDragging = false
    @State private var selectionBubbleIsBouncing = false
    
    public init(
        selection: Binding<Item>,
        items: [Item],
        background: BackgroundView.Style = .glass(tint: .accentColor.opacity(0.2)),
        selectionBackground: BackgroundView.Style = .glass(tint: .accentColor.opacity(0.4))
    ) {
        self._selectedItem = selection
        self.items = items
        self.backgroundStyle = background
        self.selectionBubbleBackgroundStyle = selectionBackground
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let layout = getLayout(in: proxy)
            
            ZStack(alignment: .leading) {
                self.barView(in: layout)
                self.selectionBubbleView(in: layout)
                self.itemStackView(in: layout)
            }
            .gesture(
                DragGesture(minimumDistance: 4)
                    .onChanged { value in
                        self.selectionBubbleIsDragging = true
                        self.selectionBubbleDragOffsetX = getDragOffsetX(location: value.location, in: layout)
                    }
                    .onEnded { _ in
                        let offsetX = self.selectionBubbleDragOffsetX ?? layout.selectionBubbleOffsetX
                        let index = getTabIndex(offsetX: offsetX, in: layout)
                        
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                            self.selectedItem = self.items[index]
                            self.selectionBubbleDragOffsetX = nil
                        }
                        
                        self.selectionBubbleIsDragging = false
                    }
            )
        }
        .frame(height: Self.height)
    }
    
    // MARK: Private
    
    private func barView(in layout: Layout) -> some View {
        BackgroundView(
            shape: .capsule,
            style: self.backgroundStyle
        )
        .frame(size: layout.barSize)
        .zIndex(1)
    }
    
    private func selectionBubbleView(in layout: Layout) -> some View {
        BackgroundView(
            shape: .capsule,
            style: self.selectionBubbleBackgroundStyle
        )
        .frame(size: layout.selectionBubbleSize)
        .offset(point: layout.selectionBubblePosition)
        .scaleEffect(layout.selectionBubbleScale)
        .animation(
            .interactiveSpring(response: 0.28, dampingFraction: 0.86),
            value: layout.selectionBubblePosition.x
        )
        .allowsHitTesting(false)
        .zIndex(2)
    }
    
    private func itemStackView(in layout: Layout) -> some View {
        HStack(spacing: 0) {
            ForEach(Array(self.items.enumerated()), id: \.element.id) { index, item in
                itemView(
                    item,
                    index: index,
                    selected: index == self.selectedItem.id,
                    in: layout
                )
            }
        }
        .frame(size: layout.barSize)
        .zIndex(3)
    }
    
    private func itemView(
        _ item: Item,
        index: Int,
        selected: Bool,
        in layout: Layout
    ) -> some View {
        VStack(spacing: 4) {
            item.image.swift
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(selected ? item.selectedColor : item.deselectedColor)

            if let title = item.title {
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(selected ? item.selectedColor : item.deselectedColor)
            }
        }
        .frame(size: layout.itemSize)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                self.selectedItem = self.items[index]
            }
            bounceSelectionBubble()
        }
    }
    
    private func getLayout(in proxy: GeometryProxy) -> Layout {
        let barSize: CGSize = .init(
            width: proxy.size.width,
            height: Self.height
        )

        let itemSize: CGSize = .init(
            width: barSize.width / CGFloat(self.items.count),
            height: barSize.height
        )

        let selectionBubbleSize: CGSize = .init(
            width: itemSize.width - self.selectionBubbleInset,
            height: barSize.height - self.selectionBubbleInset
        )
        
        let selectionBubbleEdgeInset = self.selectionBubbleInset / 2
        let selectionBubbleMinOffsetX = barSize.width - selectionBubbleSize.width
        let selectionBubbleMaxOffsetX = selectionBubbleEdgeInset
        let selectionBubbleTargetOffsetX = itemSize.width * CGFloat(self.selectedItem.id) + selectionBubbleEdgeInset
        let selectionBubbleOffsetX = min(selectionBubbleMinOffsetX, max(selectionBubbleMaxOffsetX, selectionBubbleTargetOffsetX))
        
        let selectionBubblePosition: CGPoint = .init(
            x: self.selectionBubbleDragOffsetX ?? selectionBubbleOffsetX,
            y: 0
        )
        
        let selectionBubbleScale =  (self.selectionBubbleIsDragging || self.selectionBubbleIsBouncing) ? 1.05 : 1
        
        return .init(
            barSize: barSize,
            itemSize: itemSize,
            selectionBubbleSize: selectionBubbleSize,
            selectionBubbleOffsetX: selectionBubbleOffsetX,
            selectionBubblePosition: selectionBubblePosition,
            selectionBubbleScale: selectionBubbleScale
        )
    }
    
    private func getDragOffsetX(
        location: CGPoint,
        in layout: Layout
    ) -> CGFloat {
        let edgeInset = self.selectionBubbleInset / 2
        let targetOffsetX = location.x - (layout.selectionBubbleSize.width / 2)
        let maxOffsetX = layout.barSize.width - layout.selectionBubbleSize.width
        return min(maxOffsetX, max(0, targetOffsetX))
    }
    
    private func getTabIndex(
        offsetX: CGFloat,
        in layout: Layout
    ) -> Int {
        let center = offsetX + (layout.selectionBubbleSize.width / 2)
        let index = Int(center / layout.itemSize.width)
        return min(self.items.count - 1, max(0, index))
    }
    
    private func bounceSelectionBubble() {
        withAnimation(.spring(response: 0.22, dampingFraction: 0.6)) {
            self.selectionBubbleIsBouncing = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.9)) {
                self.selectionBubbleIsBouncing = false
            }
        }
    }
}
