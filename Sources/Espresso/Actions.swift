//
//  Actions.swift
//  Espresso
//
//  Created by Mitch Treece on 5/12/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// An action that provides no values, and returns nothing.
public typealias VoidAction = () -> Void

/// An action that's performed on the main-actor, provides no values, and returns nothing.
public typealias MainVoidAction = @MainActor () -> Void

/// An action that provides a single value, and returns nothing.
public typealias Action<T> = (T) -> Void

/// An action that's performed on the main-actor, provides a single value, and returns nothing.
public typealias MainAction<T> = @MainActor (T) -> Void

/// An action that provides two values, and returns nothing.
public typealias Action2<T, U> = (T, U) -> Void

/// An action that's performed on the main-actor, provides two values, and returns nothing.
public typealias MainAction2<T, U> = @MainActor (T, U) -> Void

/// An action that provides three values, and returns nothing.
public typealias Action3<T, U, V> = (T, U, V) -> Void

/// An action that's performed on the main-actor, provides three values, and returns nothing.
public typealias MainAction3<T, U, V> = @MainActor (T, U, V) -> Void
