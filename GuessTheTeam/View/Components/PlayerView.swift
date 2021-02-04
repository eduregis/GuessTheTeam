//
//  PlayerView.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import UIKit

class PlayerView: UIView {
    
    lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.textAlignment = .center
        label.textColor = .ivory
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        return label
    }()
    
    init(playerName: String = "Neymar", shieldOrFlag: String = "brazil") {
        super.init(frame: .zero)
        flagImage.image = UIImage(named: shieldOrFlag)
        playerNameLabel.text = playerName
        configureLayout()
        self.isHidden = true
    }
    
    func setPlayer(playerName: String, shieldOrFlag: String) {
        flagImage.image = UIImage(named: shieldOrFlag)
        playerNameLabel.text = playerName
        self.isHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 70),
            flagImage.widthAnchor.constraint(equalToConstant: 40),
            flagImage.heightAnchor.constraint(equalToConstant: 40),
            flagImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            flagImage.topAnchor.constraint(equalTo: self.topAnchor),
            playerNameLabel.topAnchor.constraint(equalTo: flagImage.bottomAnchor),
            playerNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
