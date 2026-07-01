//
//  Actions.swift
//  Espresso
//
//  Created by Mitch Treece on 5/12/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

// MARK: VoidAction

/// An action that provides no values, and returns nothing.
public typealias VoidAction = () -> Void

/// A sendable action that provides no values, and returns nothing.
public typealias SendableVoidAction = @Sendable () -> Void

/// A main-actor isolated action that provides no values, and returns nothing.
public typealias MainVoidAction = @MainActor () -> Void

// MARK: Action

/// An action that provides a single value, and returns nothing.
public typealias Action<T> = (T) -> Void

/// A sendable action that provides a single value, and returns nothing.
public typealias SendableAction<T> = @Sendable (T) -> Void

/// A main-actor isolated action that provides a single value, and returns nothing.
public typealias MainAction<T> = @MainActor (T) -> Void

// MARK: Action2

/// An action that provides two values, and returns nothing.
public typealias Action2<T, U> = (T, U) -> Void

/// A sendable action that provides two value, and returns nothing.
public typealias SendableAction2<T, U> = @Sendable (T, U) -> Void

/// A main-actor isolated action that provides two value, and returns nothing.
public typealias MainAction2<T, U> = @MainActor (T, U) -> Void

// MARK: Action3

/// An action that provides three values, and returns nothing.
public typealias Action3<T, U, V> = (T, U, V) -> Void

/// A sendable action that provides three value, and returns nothing.
public typealias SendableAction3<T, U, V> = @Sendable (T, U, V) -> Void

/// An action that's performed on the main-actor, provides three values, and returns nothing.
public typealias MainAction3<T, U, V> = @MainActor (T, U, V) -> Void
