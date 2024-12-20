//
//  FavoriteCell.swift
//  idealistaChallenge
//
//  Created by diegitsen on 19/12/24.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
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
    let savedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        container.addSubview(typeLabel)
        container.addSubview(priceLabel)
        container.addSubview(addressLabel)
        container.addSubview(neighborhoodLabel)
        container.addSubview(infoStackView)
        container.addSubview(savedDateLabel)
        
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
            
            typeLabel.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 14),
            typeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            typeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            
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
            
            savedDateLabel.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            savedDateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            savedDateLabel.heightAnchor.constraint(equalToConstant: 36),
            savedDateLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            
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
        
    }
    
    func setupCell(property: PropertyEntity, favorite: FavoriteEntity) {
        self.property = property
        addressLabel.text = "\(property.address), \(property.municipality)"
        let picturesUrls = property.pictures.map { $0.url }
        carouselView.configure(with: picturesUrls)
        operationLabel.backgroundColor = property.operation.color
        operationLabel.text = "  \(property.operation.name)  "
        typeLabel.text = property.propertyType.name
        priceLabel.text = property.priceInfo
        neighborhoodLabel.text = "\(property.neighborhood), \(property.district)"
        roomsLabel.text = "\(property.rooms)"
        bathLabel.text = "\(property.bathrooms)"
        sizeLabel.text = "\(property.size) m2"
        savedDateLabel.text = "Guardado el \(favorite.date)"
    }

    // MARK: - Interaction handling
    
}
