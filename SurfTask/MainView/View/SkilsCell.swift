//
//  SkilsCell.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

class SkilsCell: UICollectionViewCell {
    weak var delegate: MainViewControllerDelegate?
    
    var viewModel: SkilsCellViewModel? {
        didSet {
            guard let viewModel else { return }
            skilsLabel.text = viewModel.skil
            configure()
            layout()
        }
    }
    
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
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private var deleteButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Add views
    private func configure() {
        contentView.addSubview(background)
        contentView.addSubview(skilsLabel)
        guard let viewModel else { return }
        if viewModel.isEditing {
            contentView.addSubview(deleteButton)
        }
        
    }
    
    //MARK: - Constraints
    func layout() {
        guard let viewModel else { return }
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        if viewModel.isEditing {
            NSLayoutConstraint.activate([
                deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                deleteButton.widthAnchor.constraint(equalToConstant: 14),
                deleteButton.heightAnchor.constraint(equalToConstant: 14),
                deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
            ])
            NSLayoutConstraint.activate([
                skilsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                skilsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),

            ])
        } else {
            NSLayoutConstraint.activate([
                skilsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                skilsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                skilsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                skilsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            ])
        }
    }
}

extension SkilsCell {
    @objc
    func deleteCell() {
        guard let viewModel else { return }
        delegate?.delete(at: viewModel.index)
    }
}
