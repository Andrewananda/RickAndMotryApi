//
//  Presenter.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation
import UIKit


class DialogPresenter {
    static let shared = DialogPresenter()
    typealias ActionClosure = () -> Void
    
    private init() {}
    
    func showError(in viewController: UIViewController, title: String, message: String, completion: ActionClosure? = nil) {
        DispatchQueue.main.async {
            let errorDialog = CustomPopup(title: title, message: message)
            errorDialog.btnOkayClicked = {
                completion?()
            }
            errorDialog.frame = viewController.view.bounds
            errorDialog.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController.view.addSubview(errorDialog)
        }
    }
}
