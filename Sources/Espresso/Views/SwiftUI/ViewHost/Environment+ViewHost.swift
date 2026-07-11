//
//  Environment+ViewHost.swift
//  Espresso
//
//  Created by Mitch Treece on 7/10/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI

extension EnvironmentValues {
    
    @Entry @MainActor
    public var viewHost: any ViewHosting = ViewHostMock()
}
