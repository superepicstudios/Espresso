//
//  ViewHost.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI
public import UIKit

@MainActor
public protocol ViewHosting: AnyObject, Observable {
    var controller: UIViewController? { get }
    var isControllerVisible: Bool { get }
}

extension ViewHosting {
    
    /// Resolves the host at action time and executes the async closure if it exists.
    ///
    /// Use this from async escaping closures instead of unwrapping `host`
    /// while building SwiftUI views, which can accidentally retain the host.
    ///
    /// - Important: The `host` passed to the closure is a strong reference to the
    ///   `UIViewController` weakly held by this container. Do not retain `host`
    ///   beyond the lifetime of the closure — doing so can create a reference cycle
    ///   in SwiftUI views hosted by this container.
    public func withHostingController(_ body: (UIViewController) async -> Void) async {
        guard let controller else {
            return
        }
        await body(controller)
    }
}

@MainActor @Observable
public final class ViewHost: ViewHosting {
    
    public internal(set) weak var controller: UIViewController?
    public internal(set) var isControllerVisible: Bool = false
    
    nonisolated init() {}
}

// MARK: UIKit

extension ViewHosting {
    
    public func present(
        _ viewController: UIViewController,
        animated: Bool = true,
        style: UIModalPresentationStyle = .automatic,
        embedInNavigation: Bool = false,
        completion: VoidAction? = nil
    ) {
        guard let hostingController = self.controller else {
            return
        }

        let controller: UIViewController = if embedInNavigation {
            UINavigationController(rootViewController: viewController)
        } else { viewController }

        controller.modalPresentationStyle = style

        hostingController.present(
            controller,
            animated: animated,
            completion: completion
        )
    }
    
    public func dismiss(
        animated: Bool = true,
        completion: VoidAction? = nil
    ) {
        self.controller?.dismiss(
            animated: animated,
            completion: completion
        )
    }
    
    public func push(
        _ viewController: UIViewController,
        animated: Bool = true
    ) {
        self.controller?.navigationController?.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    public func pop(animated: Bool = true) {
        self.controller?.navigationController?.popViewController(animated: animated)
    }
    
    public func popToViewController(
        _ viewController: UIViewController,
        animated: Bool = true
    ) {
        self.controller?.navigationController?.popToViewController(
            viewController,
            animated: animated
        )
    }
    
    public func popToRoot(animated: Bool = true) {
        self.controller?.navigationController?.popToRootViewController(animated: animated)
    }
}

// MARK: SwiftUI

extension ViewHosting {
    
    public func present(
        _ content: some View,
        animated: Bool = true,
        style: UIModalPresentationStyle = .automatic,
        embedInNavigation: Bool = false,
        completion: VoidAction? = nil
    ) {
        present(
            ViewHostingController(content: content),
            animated: animated,
            style: style,
            embedInNavigation: embedInNavigation,
            completion: completion
        )
    }
    
    public func present(
        animated: Bool = true,
        style: UIModalPresentationStyle = .automatic,
        embedInNavigation: Bool = false,
        @ViewBuilder content: @escaping () -> some View,
        completion: VoidAction? = nil
    ) {
        present(
            content(),
            animated: animated,
            style: style,
            embedInNavigation: embedInNavigation,
            completion: completion
        )
    }
    
    public func push(
        _ content: some View,
        animated: Bool = true
    ) {
        let hostingController = ViewHostingController(content: content)
//        hostingController.hidesBottomBarWhenPushed = self.host?.hidesBottomBarWhenPushed ?? false

        push(
            hostingController,
            animated: animated
        )
    }
    
    public func push(
        animated: Bool = true,
        @ViewBuilder content: @escaping () -> some View
    ) {
        push(
            content(),
            animated: animated
        )
    }
}
