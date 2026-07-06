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
                host: self.host
            )
        }
    }
    
    private let host = ViewHost()
    public private(set) var isViewVisible = false
    
    // MARK: Initializers
    
    public init(content: Content) {
        super.init(rootView: HostedView(
            content: content,
            host: self.host
        ))

        self.host.controller = self
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
        self.host.isControllerVisible = true
    }

    override open func viewDidAppear(_ animated: Bool) {
        self.isViewVisible = true
        super.viewDidAppear(animated)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.host.isControllerVisible = false
    }

    override open func viewDidDisappear(_ animated: Bool) {
        self.isViewVisible = false
        super.viewDidDisappear(animated)
    }
}

extension ViewHostingController {
    
    public struct HostedView: View {

        fileprivate let content: Content
        private var host: ViewHost

        fileprivate init(
            content: Content,
            host: ViewHost
        ) {
            self.content = content
            self.host = host
        }
        
        public var body: some View {
            self.content.environment(self.host)
        }
    }
}
