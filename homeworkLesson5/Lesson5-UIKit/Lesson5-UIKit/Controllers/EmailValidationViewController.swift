//
//  EmailValidationViewController.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import Foundation
import UIKit

class EmailValidationViewController: UIViewController {
    
    private lazy var emailView = EmailValidationView()
    
    override func loadView() {
        view = emailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
}

extension EmailValidationViewController {
    @objc
    private func didTapValidateButton(_ sender: UIButton) {
        if sender == emailView.validateButton {
            let regExString = "[A-Za-z0-9]{2,}+@{1}+[a-z0-9]{2,}+\\.{1}+[a-z]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
            let text = emailView.getTextFromTextField()
            let isValid = predicate.evaluate(with: text)
            emailView.setValidationText(isValid: isValid)
            emailView.setValidationTextColor(isValid: isValid)
        }
    }
    
    @objc
    private func didTapBackButton(_ sender: UIButton) {
        if sender == emailView.backButton {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupButtons() {
        emailView.validateButton.addTarget(self, action: #selector(didTapValidateButton(_:)), for: .touchUpInside)
        emailView.backButton.addTarget(self, action: #selector(didTapBackButton(_:)), for: .touchUpInside)
    }
}
