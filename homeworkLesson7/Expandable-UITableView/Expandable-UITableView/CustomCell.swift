//
//  CustomCell.swift
//  Expandable-UITableView
//
//  Created by Светлана on 17.03.2022.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    private lazy var albomCoverImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var albomTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.1
        label.sizeToFit()
        label.text = "Rating: -"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "star"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String, imageString: String, rating: Int) {
        albomTitleLabel.text = title
        ratingLabel.text = "Rating: \(rating)"
        albomCoverImageView.image = UIImage(systemName: imageString)
    }
}

// MARK: - Private methods
extension CustomCell {
    private func initCell() {
        contentView.addSubview(albomCoverImageView)
        contentView.addSubview(albomTitleLabel)
        contentView.addSubview(button)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(starImageView)

        NSLayoutConstraint.activate([
            albomCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            albomCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            albomCoverImageView.widthAnchor.constraint(equalToConstant: 75),
            albomCoverImageView.heightAnchor.constraint(equalToConstant: 60),
            albomCoverImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            albomTitleLabel.topAnchor.constraint(equalTo: albomCoverImageView.topAnchor),
            albomTitleLabel.leadingAnchor.constraint(equalTo: albomCoverImageView.trailingAnchor, constant: 20),
            albomTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: albomTitleLabel.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            ratingLabel.topAnchor.constraint(equalTo: button.topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: albomTitleLabel.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor, constant: -10),
            
            starImageView.topAnchor.constraint(equalTo: button.topAnchor),
            starImageView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20),
            starImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 20),
            starImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
