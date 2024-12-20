//
//  DescriptionSheetViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 19/12/24.
//

import UIKit

class DescriptionSheetViewController: UIViewController, MainProtocol {
    
    var descriptionText: String = ""
    
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
    let descriptionLabel: UILabel = {
        let image = UILabel()
        image.numberOfLines = 0
        image.textAlignment = .justified
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
        setupData()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(descriptionLabel)
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
            
            descriptionLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    func setupInteractions() {
        
    }
    
    func setupData() {
        descriptionLabel.text = descriptionText
    }
    
    func setupViews() {
        title = "Descripción"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
