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
    
    private var locationButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "location"), for: .normal)
        button.setTitle(" Воронеж", for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(UIColor(hexString: "#96959B"), for: .normal)
        button.tintColor = UIColor(hexString: "#96959B")
        return button
    }()
    
    private var backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var skilsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Мои навыки"
        return label
    }()
    private var editButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pencil"), for: .normal)
        return button
    }()
    
    private var collectionIdentifire = "collectionCell"
    
    private lazy var collection: UICollectionView = {
       let layout = CustomCollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(SkilsCell.self, forCellWithReuseIdentifier: collectionIdentifire)
        return collection
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
        scrollView.addSubview(locationButton)
        scrollView.addSubview(backgroundView)
        scrollView.addSubview(skilsLabel)
        scrollView.addSubview(editButton)
        scrollView.addSubview(collection)
    }
}

//MARK: - Constraints
extension MainViewController {
    
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
            collection.leadingAnchor.constraint(equalTo: skilsLabel.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: editButton.trailingAnchor),
            collection.topAnchor.constraint(equalTo: skilsLabel.bottomAnchor, constant: 16),
            collection.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifire, for: indexPath) as? SkilsCell else { return UICollectionViewCell()}
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = "MVI/MVVM"
        label.sizeToFit()
        return CGSize(width: label.frame.width + 48, height: 44)
    }
}
