//
//  ViewController.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import UIKit
import CoreData

class FieldController: UIViewController {

    private let fieldPresenter: FieldPresenter
    var teams: [Team] = []
    var team_index = 1
    
    init() {
        self.fieldPresenter = FieldPresenter()
        super.init(nibName: nil, bundle: nil)
        configureLayout()
        self.view.backgroundColor = UIColor.backgroundPurple
        teams = fieldPresenter.readTeams()
        print(teams[team_index].name!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var timerView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 5
        label.layer.borderColor = UIColor.actionBlue.cgColor
        label.backgroundColor = .clear
        label.layer.cornerRadius = 10
        label.text = "timer"
        label.font = UIFont(name: "Righteous-Regular", size: 22)
        label.textAlignment = .center
        label.textColor = .actionBlue
        label.isHidden = true
        self.view.addSubview(label)
        return label
    }()
    
    lazy var fieldView: FieldView = {
        let field = FieldView()
        field.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(field)
        return field
    }()
    
    lazy var customButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .actionBlue
        button.layer.cornerRadius = 10
        button.setTitle("Iniciar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Righteous-Regular", size: 24)
        button.setTitleColor(.backgroundPurple, for: .normal)
        button.addTarget(self, action: #selector(mainButton), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()
    
    @objc func mainButton() {
        fieldPresenter.setPlayersInField(field: fieldView, club: teams[team_index].name!)
        timerView.isHidden = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            
            timerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            timerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            timerView.heightAnchor.constraint(equalToConstant: 59),
            
            fieldView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 60),
            fieldView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            fieldView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            
            customButton.topAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: 100),
            customButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            customButton.heightAnchor.constraint(equalToConstant: 59)
        ])
    }
}
