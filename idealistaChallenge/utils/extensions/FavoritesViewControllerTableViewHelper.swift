//
//  FavoritesViewControllerTableViewHelper.swift
//  idealistaChallenge
//
//  Created by diegitsen on 19/12/24.
//

import UIKit

// MARK: - CollectionView Setup Methods
extension FavoritesViewController {
    
    func setupTableView() {
        setupCollectionViewDelegateAndDataSource()
        registerCollectionViewCells()
    }

    private func setupCollectionViewDelegateAndDataSource() {
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.separatorStyle = .none
    }

    private func registerCollectionViewCells() {
        favoritesTableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.cellID)
    }
}

// MARK: - CollectionView DataSource and Delegate Methods

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favorites.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.cellID) as! FavoriteCell
        guard let favorites = viewModel.favorites.value else {
            return cell
        }
        let favorite = favorites[indexPath.row]
        guard let property = viewModel.properties.first(where: { $0.id == favorite.id }) else {
            return cell
        }
        cell.setupCell(property: property, favorite: favorite)
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let propertyDetailViewController = PropertyDetailViewController()
        self.navigationController?.pushViewController(propertyDetailViewController, animated: true)
    }
}
