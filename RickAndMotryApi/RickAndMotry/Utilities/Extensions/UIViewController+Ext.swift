//
//  UIViewController+Ext.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation
import UIKit

extension UIViewController {
    private struct AssociatedKeys {
        static var loadingView = "loadingView"
    }

    private var loadingView: LoadingView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.loadingView) as? LoadingView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.loadingView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func showLoading() {
        guard loadingView == nil else { return }
        
        DispatchQueue.main.async {
            let loadingView = LoadingView(frame: self.view.bounds)
            self.view.addSubview(loadingView)
            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.loadingView = loadingView
        }
        
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
}
