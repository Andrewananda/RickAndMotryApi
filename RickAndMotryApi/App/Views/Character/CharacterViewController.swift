//
//  CharacterViewController.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import UIKit
import SwiftUI

class CharacterViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
        viewModel.fetchCharacters()
        
        self.title =  "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        
        let character = viewModel.character(at: indexPath.row)
        cell.configure(with: character)
        
        if indexPath.row == viewModel.numberOfCharacters() - 1 {
            viewModel.fetchCharacters()
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

