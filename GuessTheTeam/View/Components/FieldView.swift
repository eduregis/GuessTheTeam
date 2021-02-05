//
//  Field.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import UIKit

class FieldView: UIView {
    
    var team: [PlayerView] = []
    
    lazy var fieldImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    lazy var goalkeeper: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var centerBack: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var leftBack: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var rightBack: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var leftWingBack: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var rightWingBack: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var leftMidfielder: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var rightMidfielder: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var midfielder: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var leftWing: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var rightWing: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var striker: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var secondStriker: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var leftCenterForward: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    lazy var rightCenterForward: PlayerView = {
        let player = PlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(player)
        team.append(player)
        return player
    }()
    
    init() {
        super.init(frame: .zero)
        fieldImage.image = UIImage(named: "field")
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            fieldImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fieldImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            fieldImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            fieldImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            goalkeeper.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            goalkeeper.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50),
            
            centerBack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            centerBack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            
            leftBack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -55),
            leftBack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            
            rightBack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 55),
            rightBack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            
            leftWingBack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -120),
            leftWingBack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            
            rightWingBack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 120),
            rightWingBack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            
            leftMidfielder.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -80),
            leftMidfielder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110),
            
            rightMidfielder.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80),
            rightMidfielder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110),
            
            midfielder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            midfielder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -105),
            
            leftWing.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -80),
            leftWing.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -210),
            
            rightWing.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80),
            rightWing.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -210),
            
            striker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            striker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -235),
            
            secondStriker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondStriker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -180),
            
            leftCenterForward.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -40),
            leftCenterForward.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -225),
            
            rightCenterForward.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 40),
            rightCenterForward.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -225),
        ])
    }
}
