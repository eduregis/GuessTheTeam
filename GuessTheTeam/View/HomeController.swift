//
//  HomeController.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 05/02/21.
//

import UIKit

class HomeController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Righteous-Regular", size: 48)
        label.textColor = .actionBlue
        label.text = "GUESS THE TEAM"
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var backgroundPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "home-background")
        self.view.addSubview(imageView)
        return imageView
    }()
    
    lazy var dimmingOverlay: UIView = {
        let dim = UIView()
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.backgroundColor = .backgroundPurple
        dim.layer.opacity = 0.7
        self.view.addSubview(dim)
        return dim
    }()
    
    lazy var customButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .actionBlue
        button.layer.cornerRadius = 10
        button.setTitle("Iniciar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Righteous-Regular", size: 24)
        button.setTitleColor(.backgroundPurple, for: .normal)
        button.addTarget(self, action: #selector(triggerFieldController), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()
    
    @objc func triggerFieldController() {
        let fieldController = FieldController()
        fieldController.modalPresentationStyle = .fullScreen
        present(fieldController, animated: true, completion: nil)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            backgroundPhoto.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            backgroundPhoto.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            backgroundPhoto.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundPhoto.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            logoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/3),
            logoLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            logoLabel.heightAnchor.constraint(equalToConstant: 120),
            
            customButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 3*self.view.frame.height/4),
            customButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            customButton.heightAnchor.constraint(equalToConstant: 59),
            
        ])
    }
}
