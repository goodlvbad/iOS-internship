//
//  CustomHeaderView.swift
//  Expandable-UITableView
//
//  Created by Светлана on 17.03.2022.
//

import Foundation
import UIKit

final class CustomHeaderView: UITableViewHeaderFooterView {
    
    private var buttonTappedCallback:((_ tag: Int) -> Void)?
    
    private lazy var titile: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .close)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        selfInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(title: String, buttonTag: Int, buttonTappedCallback: @escaping ((_ tag: Int) -> Void)) {
        titile.text = title
        button.tag = buttonTag
        self.buttonTappedCallback = buttonTappedCallback
    }
}

extension CustomHeaderView {
    private func selfInit() {
        addSubview(titile)
        addSubview(button)
        
        NSLayoutConstraint.activate([
        
            titile.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            titile.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: titile.topAnchor),
//            button.bottomAnchor.constraint(equalTo: titile.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        let i = sender.tag
        buttonTappedCallback?(i)
    }
}
