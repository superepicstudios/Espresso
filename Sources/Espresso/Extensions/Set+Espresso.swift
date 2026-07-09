//
//  Set+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/9/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

extension Set {
    public func asArray() -> Array<Element> { .init(self) }
}
