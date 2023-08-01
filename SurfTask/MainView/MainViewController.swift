//
//  MainViewController.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI Elements
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(hexString: "#F3F3F5")
        return scrollView
    }()
    
    private var personImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.text = "Ревякин Алексей Игроевич"
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        return label
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureation()
    }
    
    //MARK: - Add views
    private func configureation() {
        title = "Профиль"
        
        view.addSubview(scrollView)
        scrollView.addSubview(personImageView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(descriptionLabel)
    }
    
    //MARK: - Constraints
    override func viewWillLayoutSubviews() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            personImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            personImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            personImageView.widthAnchor.constraint(equalToConstant: 120),
            personImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 65),
            nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -65)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
    }

}
