//
//  ViewHostMock.swift
//  Espresso
//
//  Created by Mitch Treece on 7/10/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI
public import UIKit

@MainActor @Observable
public final class ViewHostMock: ViewHosting {
    
    public let controller: UIViewController? = nil
    public let isControllerVisible: Bool = false
    
    public nonisolated init() {}
}
