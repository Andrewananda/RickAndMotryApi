//
//  Utilities.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation
import UIKit




func openSettings() {
    if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
}
