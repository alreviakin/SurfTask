//
//  SkilsCell.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

class SkilsCell: UICollectionViewCell {
    //MARK: - UI Elements
    private var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#F3F3F5")
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private var skilsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MVI/MVVM"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private var deleteButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add views
    private func configure() {
        contentView.addSubview(background)
        contentView.addSubview(skilsLabel)
//        contentView.addSubview(deleteButton)
    }
    
    //MARK: - Constraints
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            skilsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skilsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            skilsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skilsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
