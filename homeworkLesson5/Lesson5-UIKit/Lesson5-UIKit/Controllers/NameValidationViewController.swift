//
//  NameValidationViewController.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import Foundation
import UIKit

class NameValidationViewController: UIViewController {
    
    private lazy var nameView = NameValidationView()
    
    override func loadView() {
        view = nameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
}

extension NameValidationViewController {
    @objc
    private func didTapValidateButton(_ sender: UIButton) {
        if sender == nameView.validateButton {
            let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
            let text = nameView.getTextFromTextField()
            let isValid = predicate.evaluate(with: text)
            nameView.setValidationText(isValid: isValid)
            nameView.setValidationTextColor(isValid: isValid)
        }
    }
    
    @objc
    private func didTapBackButton(_ sender: UIButton) {
        if sender == nameView.backButton {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupButtons() {
        nameView.validateButton.addTarget(self, action: #selector(didTapValidateButton(_:)), for: .touchUpInside)
        nameView.backButton.addTarget(self, action: #selector(didTapBackButton(_:)), for: .touchUpInside)
    }
}
