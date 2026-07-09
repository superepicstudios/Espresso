//
//  TabViewSelectionInterceptorModifier.swift
//  Espresso
//
//  Created by Mitch Treece on 7/4/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import SwiftUI
import UIKit

extension View {
    
    public func tabViewSelectionInterceptor(
        forTabWithTitle title: String,
        onSelection: @escaping () -> Void
    ) -> some View {
        background(TabViewSelectionInterceptorView(
            tabTitle: title,
            action: onSelection
        ))
    }
}

fileprivate struct TabViewSelectionInterceptorView: UIViewControllerRepresentable {

    typealias UIViewControllerType = ViewController

    private let tabTitle: String
    private let action: () -> Void

    init(
        tabTitle: String,
        action: @escaping () -> Void
    ) {
        self.tabTitle = tabTitle
        self.action = action
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(
            tabTitle: self.tabTitle,
            action: self.action
        )
    }

    func makeUIViewController(context: Self.Context) -> ViewController {
        let vc = ViewController()
        vc.onAttach = { context.coordinator.attach($0) }
        return vc
    }

    func updateUIViewController(
        _ uiViewController: ViewController,
        context: Self.Context
    ) {
        context.coordinator.tabTitle = self.tabTitle
        context.coordinator.action = self.action
        context.coordinator.attach(uiViewController)
    }
}

// MARK: ViewController

extension TabViewSelectionInterceptorView {

    final class ViewController: UIViewController {

        var onAttach: ((UIViewController) -> Void)?

        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)
            self.onAttach?(self)
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.onAttach?(self)
        }
    }
}

// MARK: Coordinator

extension TabViewSelectionInterceptorView {

    final class Coordinator: NSObject, UITabBarControllerDelegate {

        var tabTitle: String
        var action: () -> Void

        init(
            tabTitle: String,
            action: @escaping () -> Void
        ) {
            self.tabTitle = tabTitle
            self.action = action
        }

        func attach(_ viewController: UIViewController) {
            if let tabBarController = findTabBar(near: viewController) {
                tabBarController.delegate = self
                return
            }
            DispatchQueue.main.async { [weak self, weak viewController] in
                guard let self, let viewController, let tabBarController = findTabBar(near: viewController) else {
                    return
                }
                tabBarController.delegate = self
            }
        }
        
        func tabBarController(
            _ tabBarController: UITabBarController,
            shouldSelectTab tab: UITab
        ) -> Bool {
            if tab.title != self.tabTitle {
                return true
            }
            self.action()
            return false
        }

        func tabBarController(
            _ tabBarController: UITabBarController,
            shouldSelect viewController: UIViewController
        ) -> Bool {
            if viewController.tabBarItem.title != self.tabTitle {
                return true
            }
            self.action()
            return false
        }
        
        // MARK: Private
        
        private func findTabBar(near viewController: UIViewController) -> UITabBarController? {
            if let tabBarController = viewController.tabBarController {
                return tabBarController
            }

            var parent = viewController.parent

            while let current = parent {
                if let tabBarController = current as? UITabBarController {
                    return tabBarController
                }
                parent = current.parent
            }

            return findTabBar(in: viewController.view.window?.rootViewController)
        }

        private func findTabBar(in viewController: UIViewController?) -> UITabBarController? {
            guard let viewController else {
                return nil
            }

            if let tabBarController = viewController as? UITabBarController {
                return tabBarController
            }

            if let tabBarController = viewController.tabBarController {
                return tabBarController
            }

            for child in viewController.children {
                if let tabBarController = self.findTabBar(in: child) {
                    return tabBarController
                }
            }

            return findTabBar(in: viewController.presentedViewController)
        }
    }
}
