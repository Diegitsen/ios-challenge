//
//  PropertyDetailViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 17/12/24.
//

import UIKit
import MapKit

class PropertyDetailViewController: UIViewController, MainProtocol {
    
    let viewModel = PropertyDetailViewModel()
    var cloudPropertyDetail: CloudPropertyDetail?
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let carouselView: CarouselView = {
        let carousel = CarouselView()
        carousel.translatesAutoresizingMaskIntoConstraints = false
        return carousel
    }()
    let operationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let favButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: "heart")
            config.imagePadding = 0
            config.imagePlacement = .leading
            button.configuration = config
            button.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
        return button
    }()
    let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.axis = .horizontal
        return stackView
    }()
    let roomsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let roomsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bed.double")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let roomsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bathView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bathImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bathtub")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let bathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sizeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let sizeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.split.2x1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let mapView: RoundedMapView = {
        let map = RoundedMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descripción"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionDetailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let moreDescriptionButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Mostrar más", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let characteristicsLabel: UILabel = {
        let label = UILabel()
        label.text = "Características"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(carouselView)
        containerView.addSubview(operationLabel)
        containerView.addSubview(favButton)
        containerView.addSubview(typeLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(neighborhoodLabel)
        containerView.addSubview(infoStackView)
        containerView.addSubview(mapView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(descriptionDetailLabel)
        containerView.addSubview(moreDescriptionButton)
        
        infoStackView.addArrangedSubview(roomsView)
        infoStackView.addArrangedSubview(bathView)
        infoStackView.addArrangedSubview(sizeView)
        
        roomsView.addSubview(roomsImage)
        roomsView.addSubview(roomsLabel)
        
        bathView.addSubview(bathImage)
        bathView.addSubview(bathLabel)
        
        sizeView.addSubview(sizeImage)
        sizeView.addSubview(sizeLabel)
    }
    
    private func setupObservers() {
        viewModel.propertyDetail.observe = { propertyDetail in
            self.setupPropertyDetail(cloudPropertyDetail: propertyDetail)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            carouselView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor),
            carouselView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            carouselView.heightAnchor.constraint(equalToConstant: 350),
  
            operationLabel.topAnchor.constraint(equalTo: carouselView.topAnchor, constant: 10),
            operationLabel.leadingAnchor.constraint(equalTo: carouselView.leadingAnchor, constant: 10),
//            operationLabel.heightAnchor.constraint(equalToConstant: 24),
            
            favButton.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: -46),
            favButton.trailingAnchor.constraint(equalTo: carouselView.trailingAnchor, constant: -16),
            favButton.heightAnchor.constraint(equalToConstant: 24),
            favButton.widthAnchor.constraint(equalToConstant: 24),
            
            typeLabel.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 14),
            typeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            addressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6),
            addressLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            addressLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            
            neighborhoodLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            neighborhoodLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            neighborhoodLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            
            infoStackView.topAnchor.constraint(equalTo: neighborhoodLabel.bottomAnchor, constant: 4),
            infoStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            mapView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 22),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            descriptionDetailLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionDetailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionDetailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            moreDescriptionButton.topAnchor.constraint(equalTo: descriptionDetailLabel.bottomAnchor, constant: 4),
            moreDescriptionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            moreDescriptionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            
            roomsImage.topAnchor.constraint(equalTo: roomsView.topAnchor),
            roomsImage.leadingAnchor.constraint(equalTo: roomsView.leadingAnchor),
            roomsImage.bottomAnchor.constraint(equalTo: roomsView.bottomAnchor),
            roomsImage.heightAnchor.constraint(equalToConstant: 26),
            roomsImage.widthAnchor.constraint(equalToConstant: 26),
            roomsLabel.centerYAnchor.constraint(equalTo: roomsImage.centerYAnchor),
            roomsLabel.leadingAnchor.constraint(equalTo: roomsImage.trailingAnchor, constant: 8),
            roomsLabel.trailingAnchor.constraint(equalTo: roomsView.trailingAnchor),
            roomsView.widthAnchor.constraint(equalToConstant: 50),
            
            bathImage.topAnchor.constraint(equalTo: bathView.topAnchor),
            bathImage.leadingAnchor.constraint(equalTo: bathView.leadingAnchor),
            bathImage.bottomAnchor.constraint(equalTo: bathView.bottomAnchor),
            bathImage.heightAnchor.constraint(equalToConstant: 26),
            bathImage.widthAnchor.constraint(equalToConstant: 26),
            bathLabel.centerYAnchor.constraint(equalTo: bathImage.centerYAnchor),
            bathLabel.leadingAnchor.constraint(equalTo: bathImage.trailingAnchor, constant: 8),
            bathLabel.trailingAnchor.constraint(equalTo: bathView.trailingAnchor),
            bathView.widthAnchor.constraint(equalToConstant: 50),
            
            sizeImage.topAnchor.constraint(equalTo: sizeView.topAnchor),
            sizeImage.leadingAnchor.constraint(equalTo: sizeView.leadingAnchor),
            sizeImage.bottomAnchor.constraint(equalTo: sizeView.bottomAnchor),
            sizeImage.heightAnchor.constraint(equalToConstant: 26),
            sizeImage.widthAnchor.constraint(equalToConstant: 26),
            sizeLabel.centerYAnchor.constraint(equalTo: sizeImage.centerYAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: sizeImage.trailingAnchor, constant: 8),
            sizeLabel.trailingAnchor.constraint(equalTo: sizeView.trailingAnchor),
            sizeView.widthAnchor.constraint(equalToConstant: 120),
        ])

    }
    
    func setupInteractions() {
        moreDescriptionButton.addTarget(self, action: #selector(openDescriptionSheet), for: .touchUpInside)
    }
    
    func setupPropertyDetail(cloudPropertyDetail: CloudPropertyDetail) {
        self.cloudPropertyDetail = cloudPropertyDetail
        
        let picturesUrls = cloudPropertyDetail.multimedia.images.map { $0.url }
        carouselView.configure(with: picturesUrls)
        
        operationLabel.backgroundColor = cloudPropertyDetail.operation.color
        operationLabel.text = "   \(cloudPropertyDetail.operation.name)   "
        
        addressLabel.text = "-"
        typeLabel.text = cloudPropertyDetail.propertyType.name
        priceLabel.text = cloudPropertyDetail.priceInfoDetail
        neighborhoodLabel.text = "-"
        roomsLabel.text = "\(cloudPropertyDetail.moreCharacteristics.roomNumber)"
        bathLabel.text = "\(cloudPropertyDetail.moreCharacteristics.bathNumber)"
        sizeLabel.text = "\(cloudPropertyDetail.moreCharacteristics.constructedArea) m2"
        
        mapView.addMarker(latitude: cloudPropertyDetail.ubication.latitude, longitude: cloudPropertyDetail.ubication.longitude)
        
        descriptionDetailLabel.text = cloudPropertyDetail.propertyComment
    }
    
    func setupData() {
      
    }
    
    func setupViews() {
        title = "Detalle"
        
    }
    
    func getPropertyDetail() {
        Task {
            self.viewModel.propertyDetail.value = nil
            await viewModel.getDetailOfProperty()
        }
    }
    
    // MARK: - Interaction Handling
    @objc func openDescriptionSheet() {
        let descriptionSheet = DescriptionSheetViewController()
        descriptionSheet.descriptionText = cloudPropertyDetail?.propertyComment ?? ""
        let nav = UINavigationController(rootViewController: descriptionSheet)
        nav.modalPresentationStyle = .pageSheet
        self.present(nav, animated: true)
    }
}
