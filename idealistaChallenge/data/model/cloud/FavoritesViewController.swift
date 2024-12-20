//
//  FavoritesViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import UIKit

class FavoritesViewController: UIViewController, MainProtocol {
    
    let viewModel = FavoritesViewModel()
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let notFavoritesYetView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let notFavoritesYetLabel: UILabel = {
        let image = UILabel()
        image.text = "No hay favoritos aún"
        image.font = .boldSystemFont(ofSize: 22)
        image.numberOfLines = 0
        image.textAlignment = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let notFavoritesImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.slash.fill")
        image.tintColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupViews()
        setupTableView()
        setupObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        
        containerView.addSubview(notFavoritesYetView)
        containerView.addSubview(favoritesTableView)
        
        notFavoritesYetView.addSubview(notFavoritesYetLabel)
        notFavoritesYetView.addSubview(notFavoritesImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            notFavoritesYetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            notFavoritesYetView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            notFavoritesYetView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            notFavoritesImage.topAnchor.constraint(equalTo: notFavoritesYetView.topAnchor),
            notFavoritesImage.centerXAnchor.constraint(equalTo: notFavoritesYetView.centerXAnchor),
            notFavoritesImage.heightAnchor.constraint(equalToConstant: 62),
            notFavoritesImage.widthAnchor.constraint(equalToConstant: 62),
            
            notFavoritesYetLabel.topAnchor.constraint(equalTo: notFavoritesImage.bottomAnchor, constant: 15),
            notFavoritesYetLabel.leadingAnchor.constraint(equalTo: notFavoritesYetView.leadingAnchor),
            notFavoritesYetLabel.trailingAnchor.constraint(equalTo: notFavoritesYetView.trailingAnchor),
            notFavoritesYetLabel.bottomAnchor.constraint(equalTo: notFavoritesYetView.bottomAnchor),
            
            favoritesTableView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoritesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            favoritesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            favoritesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    func setupInteractions() {
        
    }
    
    func setupData() {
        viewModel.favorites.value = nil
        viewModel.getFavorites()
    }
    
    func setupViews() {
        title = "Favoritos"
    }
    
    private func setupObservers() {
        viewModel.favorites.observe = { favorites in
            if (favorites.isEmpty) {
                self.notFavoritesYetView.isHidden = false
                self.favoritesTableView.isHidden = true
            } else {
                self.notFavoritesYetView.isHidden = true
                self.favoritesTableView.isHidden = false
                self.favoritesTableView.reloadData()
            }
        }
    }
    
}
//
