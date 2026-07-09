//
//  Array+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/9/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

extension Array where Element: Hashable {
    public func asSet() -> Set<Element> { .init(self) }
}
