//
//  CharacterViewController.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import UIKit
import SwiftUI

class CharacterViewController: UIViewController {
    
    //MARK: properties
    private let tableView = UITableView()
    private let viewModel = CharacterViewModel()
    private let filters = ["Alive", "Dead", "Unknown"]
    private var selectedFilter: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        viewModel.fetchCharacters()
        
        self.title =  "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    private let filterCollectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          layout.minimumInteritemSpacing = 12
          layout.minimumLineSpacing = 12
          
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.showsHorizontalScrollIndicator = false
          collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
          return collectionView
      }()
    
    
    private func setupView() {
        
        
        view.backgroundColor = UIColor.systemBackground
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        view.addSubview(filterCollectionView)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.onCharactersFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.isLoading = {[weak self] isLoading in
            guard let self = self else { return }
            if isLoading {
                self.showLoading()
            } else  {
                self.hideLoading()
            }
        }
        
        viewModel.errorResponse = {[weak self] error in
            guard let self = self else { return }
            if error == .internetConnection {
                DialogPresenter.shared.showError(in: self, title: "Error", message: error.message) {
                    openSettings()
                }
            } else {
                DialogPresenter.shared.showError(in: self, title: "Error", message: error.message)
            }
        }
        
    }
}

extension CharacterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCharacters()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        if viewModel.numberOfCharacters() > 0 {
            let character = viewModel.character(at: indexPath.row)
            cell.configure(with: character)
            
            if indexPath.row == viewModel.numberOfCharacters() - 1 {
                viewModel.fetchCharacters(filter: selectedFilter)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.character(at: indexPath.row)
        let detailVC = UIHostingController(rootView: CharacterDetailView(character: character))
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}



extension CharacterViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return filters.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell else {
               return UICollectionViewCell()
           }
           let filter = filters[indexPath.row]
           let isSelected = filter == selectedFilter
           cell.configure(with: filter, isSelected: isSelected)
           return cell
       }
       
       // MARK: - UICollectionView Delegate
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           selectedFilter = filters[indexPath.row]
           viewModel.fetchCharacters(filter: selectedFilter, shouldClear: true)
           collectionView.reloadData()
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let filterText = filters[indexPath.row]
           let textSize = (filterText as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)])
           return CGSize(width: textSize.width + 40, height: 50)
       }
    
}
