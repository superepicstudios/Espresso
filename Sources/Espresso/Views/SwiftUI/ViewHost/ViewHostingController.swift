//
//  ViewHostingController.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

public import UIKit
public import SwiftUI

open class ViewHostingController<Content: View>: UIHostingController<ViewHostingController.HostedView> {
    
    public var hostedView: Content {
        get { rootView.content }
        set {
            rootView = HostedView(
                content: newValue,
                viewHost: self.viewHost
            )
        }
    }
    
    private let viewHost = ViewHost()
    public private(set) var isViewVisible = false
    
    // MARK: Initializers
    
    public init(content: Content) {
        super.init(rootView: HostedView(
            content: content,
            viewHost: self.viewHost
        ))

        self.viewHost.controller = self
    }
    
    public convenience init(@ViewBuilder content: @escaping () -> Content) {
        self.init(content: content())
    }

    public required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    // MARK: Lifecycle
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewHost.isControllerVisible = true
    }

    override open func viewDidAppear(_ animated: Bool) {
        self.isViewVisible = true
        super.viewDidAppear(animated)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewHost.isControllerVisible = false
    }

    override open func viewDidDisappear(_ animated: Bool) {
        self.isViewVisible = false
        super.viewDidDisappear(animated)
    }
}

extension ViewHostingController {
    
    public struct HostedView: View {

        fileprivate let content: Content
        private var viewHost: any ViewHosting

        fileprivate init(
            content: Content,
            viewHost: any ViewHosting
        ) {
            self.content = content
            self.viewHost = viewHost
        }
        
        public var body: some View {
            self.content.environment(\.viewHost, self.viewHost)
        }
    }
}
