//
//  Result+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/3/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

extension Result {
    
    /// The result's error, or `nil`.
    public var error: Failure? {
        
        return switch self {
        case .failure(let error): error
        default: nil
        }
        
    }
    
}
