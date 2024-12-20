//
//  PropertyCell.swift
//  idealistaChallenge
//
//  Created by diegitsen on 16/12/24.
//


import UIKit
import MapKit

class PropertyCell: UITableViewCell {
    
    var property: PropertyEntity?
    var delegate: PropertyCellDelegate?
    
    //MARK: - UI Components
    let container: UIView = {
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
    let operationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
    let descriptionButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .white
        button.setTitle("  Ver descripción  ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let locationButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .blue
        button.setImage(UIImage(systemName: "mappin"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Class Properties
    static let cellID = "PropertyCell"
    
    // MARK: - Class Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.dropShadow()
    }
    
    private func commonInit() {
        setupLayout()
        setupInteractions()
    }
    
    func setupLayout() {
        contentView.addSubview(container)
        container.addSubview(carouselView)
        container.addSubview(operationLabel)
        container.addSubview(favButton)
        container.addSubview(typeLabel)
        container.addSubview(priceLabel)
        container.addSubview(addressLabel)
        container.addSubview(neighborhoodLabel)
        container.addSubview(infoStackView)
        container.addSubview(descriptionButton)
        container.addSubview(locationButton)
        
        infoStackView.addArrangedSubview(roomsView)
        infoStackView.addArrangedSubview(bathView)
        infoStackView.addArrangedSubview(sizeView)
        
        roomsView.addSubview(roomsImage)
        roomsView.addSubview(roomsLabel)
        
        bathView.addSubview(bathImage)
        bathView.addSubview(bathLabel)
        
        sizeView.addSubview(sizeImage)
        sizeView.addSubview(sizeLabel)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            operationLabel.topAnchor.constraint(equalTo: carouselView.topAnchor, constant: 10),
            operationLabel.leadingAnchor.constraint(equalTo: carouselView.leadingAnchor, constant: 10),
            operationLabel.heightAnchor.constraint(equalToConstant: 24),
            
            carouselView.topAnchor.constraint(equalTo: container.topAnchor),
            carouselView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            carouselView.heightAnchor.constraint(equalToConstant: 250),
            
            favButton.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: -46),
            favButton.trailingAnchor.constraint(equalTo: carouselView.trailingAnchor, constant: -16),
            favButton.heightAnchor.constraint(equalToConstant: 24),
            favButton.widthAnchor.constraint(equalToConstant: 24),
            
            typeLabel.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 14),
            typeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            typeLabel.trailingAnchor.constraint(equalTo: locationButton.leadingAnchor, constant: -8),
            
            locationButton.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 14),
            locationButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            locationButton.heightAnchor.constraint(equalToConstant: 32),
            locationButton.widthAnchor.constraint(equalToConstant: 32),
            
            priceLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            priceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            
            addressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6),
            addressLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            addressLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            
            neighborhoodLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            neighborhoodLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            neighborhoodLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            
            infoStackView.topAnchor.constraint(equalTo: neighborhoodLabel.bottomAnchor, constant: 4),
            infoStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            
            descriptionButton.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            descriptionButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            descriptionButton.heightAnchor.constraint(equalToConstant: 36),
            descriptionButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            
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
        favButton.addTarget(self, action: #selector(favoriteButtonSelected), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(goToMaps), for: .touchUpInside)
        descriptionButton.addTarget(self, action: #selector(openDescription), for: .touchUpInside)
    }
    
    func setupCell(property: PropertyEntity, isFavorite: Bool) {
        self.property = property
        addressLabel.text = "\(property.address), \(property.municipality)"
        let picturesUrls = property.pictures.map { $0.url }
        carouselView.configure(with: picturesUrls)
        setFavorite(isFavorite: isFavorite)
        operationLabel.backgroundColor = property.operation.color
        operationLabel.text = "  \(property.operation.name)  "
        typeLabel.text = property.propertyType.name
        priceLabel.text = property.priceInfo
        neighborhoodLabel.text = "\(property.neighborhood), \(property.district)"
        roomsLabel.text = "\(property.rooms)"
        bathLabel.text = "\(property.bathrooms)"
        sizeLabel.text = "\(property.size) m2"
    }
    
    func setFavorite(isFavorite: Bool) {
        if (isFavorite) {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    // MARK: - Interaction handling
    @objc func favoriteButtonSelected() {
        print("hey! fav butoon")
        var isFavorite = false
        if (favButton.currentImage == UIImage(systemName: "heart.fill")) {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favButton.tintColor = .red
            isFavorite = false
        } else {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favButton.tintColor = .red
            isFavorite = true
           
        }
        guard let propertyEntity = property else {
            return
        }
        delegate?.setPropertyInFavorite(property: propertyEntity, isFavorite: isFavorite)
    }
    
    @objc func goToMaps() {
        openAppleMaps()
    }
    
    @objc func openDescription() {
        guard let property = property else {
            return
        }
        delegate?.openDescriptionSheet(property: property)
    }
    
    func openGoogleMaps() {
        guard let property = property else {
            return
        }
        let urlScheme = "comgooglemaps://?q=\(property.latitude),\(property.longitude)"
        if let url = URL(string: urlScheme), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Si Google Maps no está instalado, abre en el navegador
            let browserURL = "https://www.google.com/maps?q=\(property.latitude),\(property.longitude)"
            if let url = URL(string: browserURL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func openAppleMaps() {
        guard let property = property else {
            return
        }
        let coordinate = CLLocationCoordinate2D(latitude: property.latitude, longitude: property.longitude)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Ubicación" // Puedes personalizar el nombre
        mapItem.openInMaps(launchOptions: nil)
    }
    
}

protocol PropertyCellDelegate {
    func setPropertyInFavorite(property: PropertyEntity, isFavorite: Bool)
    func openDescriptionSheet(property: PropertyEntity)
}
