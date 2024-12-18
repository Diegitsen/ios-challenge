//
//  PropertyDetailViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 17/12/24.
//

import UIKit

class PropertyDetailViewController: UIViewController, MainProtocol {
    
    let viewModel = PropertyDetailViewModel()
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let carouselView: CarouselView = {
        let carousel = CarouselView()
        carousel.translatesAutoresizingMaskIntoConstraints = false
        return carousel
    }()
    let xeagaImageView: UILabel = {
        let image = UILabel()
        image.text = "Detail"
        image.font = .boldSystemFont(ofSize: 22)
//        image.textColor = .mainColor
        image.numberOfLines = 0
        image.textAlignment = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupViews()
        setupObservers()
        getPropertyDetail()
    }

    override func viewWillAppear(_ animated: Bool) {
    
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        containerView.addSubview(carouselView)
        containerView.addSubview(xeagaImageView)
    }
    
    private func setupObservers() {
        viewModel.propertyDetail.observe = { propertyDetail in
            print("hey! AAA AAA AA \(propertyDetail.price)")
            self.setupPropertyDetail(cloudPropertyDetail: propertyDetail)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            carouselView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor),
            carouselView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            carouselView.heightAnchor.constraint(equalToConstant: 350),
            
            xeagaImageView.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 20),
            xeagaImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            xeagaImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
        ])
    }
    
    func setupInteractions() {
        
    }
    
    func setupPropertyDetail(cloudPropertyDetail: CloudPropertyDetail) {
        let picturesUrls = cloudPropertyDetail.multimedia.images.map { $0.url }
        carouselView.configure(with: picturesUrls)
    }
    
    func setupData() {
      
    }
    
    func setupViews() {
        title = "Detalle"
        
//        let user = PersistenceManager.shared.fetch(User.self).first
//        nifValueLabel.text = user?.nif ?? ""
//        exploitationCodeValueLabel.text = user?.exploitationId ?? ""
//
//        if let navigationBar = self.navigationController?.navigationBar {
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .mainColor
//            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//            navigationBar.standardAppearance = appearance
//            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
//            navigationBar.tintColor = .white
//        }
        
//        setupChangeLanguageButtonMenu()
    }
    
    func getPropertyDetail() {
        Task {
            self.viewModel.propertyDetail.value = nil
            await viewModel.getDetailOfProperty()
        }
    }
}
