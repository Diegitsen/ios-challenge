//
//  SettingsViewController.swift
//  idealistaChallenge
//
//  Created by diegitsen on 15/12/24.
//

import UIKit

class SettingsViewController: UIViewController, MainProtocol {
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Bienvenido! :)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let changeLanguageView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowRightImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "chevron.right")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        let politicsLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.text = "Cambiar idioma".localize()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(arrowRightImageView)
        view.addSubview(politicsLabel)
        
        NSLayoutConstraint.activate([
            arrowRightImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            arrowRightImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowRightImageView.heightAnchor.constraint(equalToConstant: 20),
            arrowRightImageView.widthAnchor.constraint(equalToConstant: 10),
            
            politicsLabel.leadingAnchor.constraint(equalTo: arrowRightImageView.trailingAnchor, constant: 10),
            politicsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            politicsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        return view
    }()
    let lineTwoView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(welcomeLabel)
        containerView.addSubview(lineView)
        containerView.addSubview(changeLanguageView)
        containerView.addSubview(lineTwoView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            welcomeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            
            lineView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 25),
            lineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            lineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            changeLanguageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15),
            changeLanguageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            changeLanguageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            changeLanguageView.heightAnchor.constraint(equalToConstant: 36),
            
            lineTwoView.topAnchor.constraint(equalTo: changeLanguageView.bottomAnchor, constant: 15),
            lineTwoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            lineTwoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            lineTwoView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func setupInteractions() {
        
    }
    
    func setupData() {
        
    }
    
    func setupViews() {
        title = "Ajustes"
        setupChangeLanguageButtonMenu()
    }
    
    func setupChangeLanguageButtonMenu() {
        let children = fetchChangeLanguageButtonMenuChilder()
        let menu = UIMenu(children: children)
        changeLanguageView.menu = menu
        changeLanguageView.showsMenuAsPrimaryAction = true
    }
    
    private func fetchChangeLanguageButtonMenuChilder() -> [UIAction] {
        let currentLanguage = UserDefaults.standard.string(forKey: "preferedLanguage")
        let galIcon = currentLanguage == "en" ? UIImage(systemName: "checkmark") : nil
        let esIcon =  currentLanguage == "es" ? UIImage(systemName: "checkmark") : nil
        let children = [
            UIAction(title: "Castellano".localize(), image: esIcon, handler: { _ in
                self.updateLanguage(language: "es")
                self.setupChangeLanguageButtonMenu()
            }),
            UIAction(title: "Inglés".localize(), image: galIcon, handler: { _ in
                self.updateLanguage(language: "en")
                self.setupChangeLanguageButtonMenu()
            })
        ]
        return children
    }
    
    func updateLanguage(language: String) {
        guard let window = self.view.window else {
            return
        }
        
        UserDefaults.standard.set(language, forKey: "preferedLanguage")
        self.view.window?.rootViewController = TabBarController()
        self.view.window?.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.5,
                        options: .transitionFlipFromLeft,
                        animations: nil,
                        completion: nil)
    }
    
}
