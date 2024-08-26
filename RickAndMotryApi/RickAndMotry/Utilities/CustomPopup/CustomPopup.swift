//
//  CustomPopup.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation
import UIKit


class CustomPopup: UIView {
    
        private let titleLabel = UILabel()
        private let messageLabel = UILabel()
        private let okButton = UIButton(type: .system)
        var btnOkayClicked: (() -> Void)?
    

        // Initialize with title and message
        init(title: String, message: String) {
            super.init(frame: .zero)
            setupView(title: title, message: message)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupView(title: String, message: String) {
            backgroundColor = UIColor.black.withAlphaComponent(0.8)
            layer.cornerRadius = 12
            clipsToBounds = true

            titleLabel.text = title
            titleLabel.textColor = .white
            titleLabel.textAlignment = .center
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.numberOfLines = 0

            messageLabel.text = message
            messageLabel.textColor = .white
            messageLabel.textAlignment = .center
            messageLabel.font = .systemFont(ofSize: 16, weight: .medium)
            messageLabel.numberOfLines = 0

            okButton.setTitle("OK", for: .normal)
            okButton.setTitleColor(.white, for: .normal)
            okButton.backgroundColor = .systemRed
            okButton.layer.cornerRadius = 8
            okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)

            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            okButton.translatesAutoresizingMaskIntoConstraints = false

            addSubview(titleLabel)
            addSubview(messageLabel)
            addSubview(okButton)

            NSLayoutConstraint.activate([
                titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                okButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                okButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                okButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                okButton.heightAnchor.constraint(equalToConstant: 44),
                okButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            ])
        }

        @objc private func okButtonTapped() {
            btnOkayClicked?()
            removeFromSuperview()
        }
}
