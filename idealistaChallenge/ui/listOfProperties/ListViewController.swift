//
//  ListViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 15/12/24.
//

import UIKit

class ListViewController: UIViewController, MainProtocol {
    
    let viewModel = ListViewModel()
    var isSortByHighestPrice = false
    var isSortByLowestPrice = false
    
    var isFilteredByRent = false
    var isFilteredByBuy = false
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    let filterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    let filterView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let filterImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        button.addSubview(filterImageView)
        
        NSLayoutConstraint.activate([
            filterImageView.heightAnchor.constraint(equalToConstant: 20),
            filterImageView.widthAnchor.constraint(equalToConstant: 20),
            filterImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5),
            filterImageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
            filterImageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -5),
            filterImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -5)
        ])
        
        return button
    }()
    let priceFilterView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let priceImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "tag")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        let priceLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.text = "Precio"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(priceImageView)
        view.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            priceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            priceImageView.heightAnchor.constraint(equalToConstant: 20),
            priceImageView.widthAnchor.constraint(equalToConstant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: priceImageView.trailingAnchor, constant: 5),
            priceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        return view
    }()
    let typeFilterView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let typeImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "list.bullet.clipboard")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        let typeLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.text = "Tipo"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(typeImageView)
        view.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            typeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            typeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            typeImageView.heightAnchor.constraint(equalToConstant: 20),
            typeImageView.widthAnchor.constraint(equalToConstant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: typeImageView.trailingAnchor, constant: 5),
            typeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            typeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        return view
    }()
    let roomsFilterView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let calendarImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "bed.double")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        let dateLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.text = "Habitaciones"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(calendarImageView)
        view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            calendarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            calendarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calendarImageView.heightAnchor.constraint(equalToConstant: 20),
            calendarImageView.widthAnchor.constraint(equalToConstant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 5),
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        return view
    }()
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupTableView()
        setupViews()
        setupObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    override func viewWillLayoutSubviews() {
        priceFilterView.dropShadow()
        filterView.dropShadow()
        typeFilterView.dropShadow()
        roomsFilterView.dropShadow()
    }
    
    func setupViews() {
        title = "Lista"
        setupTypeButtonMenu()
        setupPriceButtonMenu()
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        
        containerView.addSubview(listTableView)
        containerView.addSubview(filterStackView)
        
        filterStackView.addArrangedSubview(filterView)
        filterStackView.addArrangedSubview(priceFilterView)
        filterStackView.addArrangedSubview(typeFilterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            filterStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            filterStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            priceFilterView.widthAnchor.constraint(equalToConstant: 84),
            typeFilterView.widthAnchor.constraint(equalToConstant: 74),
            
            listTableView.topAnchor.constraint(equalTo: filterStackView.bottomAnchor, constant: 10),
            listTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            listTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            listTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    func setupInteractions() {
        
    }
    
    func setupData() {
        getListOfProperties()
    }

    
    private func setupObservers() {
        viewModel.properties.observe = { properties in
            self.listTableView.reloadData()
        }
    }
    
    func getListOfProperties() {
        Task {
            self.viewModel.properties.value = nil
            await viewModel.getListOfProperties()
        }
    }
    
    private func fetchSortPriceButtonMenuChilder() -> [UIAction] {
        let sortHighestIcon = isSortByHighestPrice ? UIImage(systemName: "checkmark") : nil
        let sortLowestIcon = isSortByLowestPrice ? UIImage(systemName: "checkmark") : nil
        let children = [
            UIAction(title: "Precio más alto", image: sortHighestIcon, handler: { _ in
                self.isSortByHighestPrice = true
                self.isSortByLowestPrice = false
                
                self.viewModel.properties.value = nil
                self.viewModel.getListOfProperties(sortOption: SortOption.HighestPrice)
                self.setupPriceButtonMenu()
            }),
            UIAction(title: "Precio más bajo", image: sortLowestIcon, handler: { _ in
                self.isSortByHighestPrice = false
                self.isSortByLowestPrice = true
                
                self.viewModel.properties.value = nil
                self.viewModel.getListOfProperties(sortOption: SortOption.LowestPrice)
                self.setupPriceButtonMenu()
            })
        ]
        return children
    }
    
    func setupPriceButtonMenu() {
        let children = fetchSortPriceButtonMenuChilder()
        let menu = UIMenu(children: children)
        priceFilterView.menu = menu
        priceFilterView.showsMenuAsPrimaryAction = true
    }
    
    private func fetchTypeButtonMenuChilder() -> [UIAction] {
        let sortRentIcon = isFilteredByRent ? UIImage(systemName: "checkmark") : nil
        let sortSaleIcon = isFilteredByBuy ? UIImage(systemName: "checkmark") : nil
        let children = [
            UIAction(title: "Venta", image: sortSaleIcon, handler: { _ in
                self.isFilteredByBuy = true
                self.isFilteredByRent = false
                
                self.viewModel.properties.value = nil
                self.viewModel.getListOfProperties(sortOption: SortOption.FilterBySale)
                self.setupTypeButtonMenu()
            }),
            UIAction(title: "Renta", image: sortRentIcon, handler: { _ in
                self.isFilteredByBuy = false
                self.isFilteredByRent = true
                
                self.viewModel.properties.value = nil
                self.viewModel.getListOfProperties(sortOption: SortOption.FilterByRent)
                self.setupTypeButtonMenu()
            })
        ]
        return children
    }
    
    func setupTypeButtonMenu() {
        let children = fetchTypeButtonMenuChilder()
        let menu = UIMenu(children: children)
        typeFilterView.menu = menu
        typeFilterView.showsMenuAsPrimaryAction = true
    }

}

enum SortOption {
    case HighestPrice, LowestPrice, FilterBySale, FilterByRent
}
