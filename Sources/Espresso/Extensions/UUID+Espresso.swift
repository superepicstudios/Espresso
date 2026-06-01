//
//  UUID+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 6/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import Foundation

extension UUID {

    /// A mock `UUID`.
    public static var mock: Self {
        .init(uuidString: "00000000-0000-0000-0000-000000000000")!
    }
}
