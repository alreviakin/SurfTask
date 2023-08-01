//
//  MainViewControllerConstraints.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

//MARK: - Constraints
extension MainViewController {
    
    override func viewWillLayoutSubviews() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
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
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            locationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            locationButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 19),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            skilsLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 21),
            skilsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 21),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        NSLayoutConstraint.activate([
            self.collection.leadingAnchor.constraint(equalTo: skilsLabel.leadingAnchor),
            self.collection.trailingAnchor.constraint(equalTo: editButton.trailingAnchor),
            self.collection.topAnchor.constraint(equalTo: skilsLabel.bottomAnchor, constant: 16),
//            self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 24),
            aboutLabel.leadingAnchor.constraint(equalTo: collection.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionAboutLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8),
            descriptionAboutLabel.leadingAnchor.constraint(equalTo: collection.leadingAnchor),
            descriptionAboutLabel.trailingAnchor.constraint(equalTo: collection.trailingAnchor),
            descriptionAboutLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

