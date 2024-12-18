//
//  PropertyCell.swift
//  idealistaChallenge
//
//  Created by diegitsen on 16/12/24.
//


import UIKit

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
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
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
            config.imagePadding = 0 // Opcional: espacio alrededor de la imagen
            config.imagePlacement = .leading
            button.configuration = config
            button.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
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
        container.addSubview(statusLabel)
        container.addSubview(carouselView)
        container.addSubview(favButton)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            carouselView.topAnchor.constraint(equalTo: container.topAnchor),
            carouselView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            carouselView.heightAnchor.constraint(equalToConstant: 250),
            
            statusLabel.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 14),
            statusLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            statusLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            
            favButton.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: -46),
            favButton.trailingAnchor.constraint(equalTo: carouselView.trailingAnchor, constant: -16),
            favButton.heightAnchor.constraint(equalToConstant: 24),
            favButton.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        
    }
    
    func setupInteractions() {
        favButton.addTarget(self, action: #selector(favoriteButtonSelected), for: .touchUpInside)
    }
    
    func setupCell(property: PropertyEntity, isFavorite: Bool) {
        self.property = property
        statusLabel.text = "\(property.address)  "
        let picturesUrls = property.pictures.map { $0.url }
        carouselView.configure(with: picturesUrls)
        setFavorite(isFavorite: isFavorite)
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
    
}

protocol PropertyCellDelegate {
    func setPropertyInFavorite(property: PropertyEntity, isFavorite: Bool)
}
