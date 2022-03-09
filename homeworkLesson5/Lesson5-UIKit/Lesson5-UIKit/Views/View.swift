//
//  View.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import Foundation
import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        selfInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selfInit()
    }
    
    func selfInit() {
        self.backgroundColor = .systemBackground
    }
}

// MARK: - Common Helper Methods

extension View {
    func buildCardView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }
    
    func buildTextView() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func buildButton(with label: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        return button
    }
    
    func buildValidationLabel() -> UILabel {
        let label = UILabel()
        label.text = "Ожидаю валидации..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
