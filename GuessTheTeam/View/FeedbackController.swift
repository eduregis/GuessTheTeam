//
//  FeedbackController.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 05/02/21.
//
import UIKit

class FeedbackController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.backgroundPurple
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Righteous-Regular", size: 32)
        label.textColor = .actionBlue
        label.text = "VOCÊ ACERTOU \(UserDefaults.standard.integer(forKey: "score"))/10!"
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var highscoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Righteous-Regular", size: 32)
        label.textColor = .actionBlue
        label.text = "SEU RECORDE É \(UserDefaults.standard.integer(forKey: "highscore"))/10!"
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var replayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .actionBlue
        button.layer.cornerRadius = 10
        button.setTitle("Jogar Novamente", for: .normal)
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
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/4),
            scoreLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            scoreLabel.heightAnchor.constraint(equalToConstant: 120),
            
            highscoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            highscoreLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 30),
            highscoreLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            highscoreLabel.heightAnchor.constraint(equalToConstant: 120),
            
            replayButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            replayButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 3*self.view.frame.height/4),
            replayButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            replayButton.heightAnchor.constraint(equalToConstant: 59),
            
        ])
    }
}
