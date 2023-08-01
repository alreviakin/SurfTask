//
//  MainViewController.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func delete(at index: Int)
}

class MainViewController: UIViewController {
    
    var viewModel = MainViewModel()
    
    //MARK: - UI Elements
    internal var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(hexString: "#F3F3F5")
        return scrollView
    }()
    
    internal var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    internal var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Ревякин Алексей Игроевич"
        label.textAlignment = .center
        return label
    }()
    
    internal var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        return label
    }()
    
    internal var locationButton: UIButton = {
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
    
    internal var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal var skilsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Мои навыки"
        return label
    }()
    internal lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.addTarget(self, action: #selector(editCollection), for: .touchUpInside)
        return button
    }()
    
    internal var collectionIdentifire = "collectionCell"
    
    internal lazy var collection: UICollectionView = {
        let layout = CustomCollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let collection = CustomCollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.isScrollEnabled = false
        collection.register(SkilsCell.self, forCellWithReuseIdentifier: collectionIdentifire)
        return collection
    }()
    
    internal var aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "About"
        return label
    }()
    
    internal var descriptionAboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "sdklfjalskdfjlkasdjflkjklfasjdlkfjslkdjfalskdfjlaksdf"
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
        scrollView.addSubview(locationButton)
        scrollView.addSubview(backgroundView)
        scrollView.addSubview(skilsLabel)
        scrollView.addSubview(editButton)
        scrollView.addSubview(collection)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(descriptionAboutLabel)
    }
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifire, for: indexPath) as? SkilsCell else { return UICollectionViewCell()}
        let cellViewModel = viewModel.getSkilCellViewModel(for: indexPath)
        cellViewModel.index = indexPath.row
        if viewModel.isEditing {
            if viewModel.isLast(at: indexPath) {
                cellViewModel.isEditing.toggle()
                cell.viewModel = cellViewModel
            } else {
                cell.viewModel = cellViewModel
            }
        } else {
            cell.viewModel = cellViewModel
        }
        cell.delegate = self
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = viewModel.getSkil(for: indexPath)
        label.sizeToFit()
        if viewModel.isEditing {
            if viewModel.isLast(at: indexPath) {
                return CGSize(width: label.frame.width + 48, height: 44)
            } else {
                return CGSize(width: label.frame.width + 48 + 24, height: 44)
            }
        } else {
            return CGSize(width: label.frame.width + 48, height: 44)
        }
    }
}

extension MainViewController {
    @objc private func editCollection() {
        if viewModel.isEditing {
            viewModel.isEditing.toggle()
            collection.reloadData()
            collection.layoutIfNeeded()
            editButton.setImage(UIImage(named: "pencil"), for: .normal)
        } else {
            viewModel.isEditing.toggle()
            print(viewModel.isEditing)
            collection.reloadData()
            collection.layoutIfNeeded()
            editButton.setImage(UIImage(named:"checkmark"), for: .normal)
        }
    }
}

//MARK: - MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate {
    func delete(at index: Int) {
        viewModel.deleteSkil(for: index)
        collection.reloadData()
        collection.layoutIfNeeded()
    }
}

//MARK: -
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.isEditing {
            if viewModel.isLast(at: indexPath) {
                showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Добавить", style: .default) {[weak self] _ in
            guard let self, let text = alert.textFields?[0].text else { return }
            self.viewModel.addSkil(skil: text)
            self.collection.reloadData()
            self.collection.layoutIfNeeded()
        }
        alert.addAction(addAction)
        present(alert, animated: true)
    }
}
