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
    var team_index = 0
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var nextTeamAvailable = false
    var points = 0
    var isLast = false
    
    init() {
        self.fieldPresenter = FieldPresenter()
        teams = fieldPresenter.readTeams()
        super.init(nibName: nil, bundle: nil)
        configureLayout()
        self.view.backgroundColor = UIColor.backgroundPurple
        self.hideKeyboardWhenTappedAround()
        print(teams.count)
        customButton.addTarget(self, action: #selector(mainButton), for: .touchUpInside)
        teams = teams.shuffled()
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
        label.text = "       0:00"
        label.font = UIFont(name: "Righteous-Regular", size: 22)
        label.textColor = .actionBlue
        label.isHidden = true
        self.view.addSubview(label)
        return label
    }()
    
    lazy var teamName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Righteous-Regular", size: 26)
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
        self.view.addSubview(button)
        return button
    }()
    
    lazy var dimmingOverlay: UIButton = {
        let dim = UIButton()
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.backgroundColor = .black
        dim.layer.opacity = 0
        dim.addTarget(self, action: #selector(self.dismissAlert), for: .touchUpInside)
        self.view.addSubview(dim)
        return dim
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .backgroundPurple
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 5
        textField.layer.borderColor = UIColor.actionBlue.cgColor
        textField.layer.opacity = 0
        textField.textColor = .actionBlue
        textField.tintColor = .actionBlue
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.font = UIFont(name: "Righteous-Regular", size: 24)
        self.view.addSubview(textField)
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .actionBlue
        button.layer.cornerRadius = 10
        button.layer.opacity = 0
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        button.addTarget(self, action: #selector(confirmName), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()
    
    lazy var feedbackBar: FeedbackBar = {
        let feedbackBar = FeedbackBar()
        feedbackBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(feedbackBar)
        return feedbackBar
    }()
    
    @discardableResult @objc func mainButton() -> Bool {
        if isLast {
            let feedBackController = FeedbackController()
            feedBackController.modalPresentationStyle = .fullScreen
            present(feedBackController, animated: true, completion: nil)
        } else {
            if nextTeamAvailable {
                fieldPresenter.hidePlayersinField(field: fieldView)
                team_index += 1
                teams = fieldPresenter.readTeams()
                print(teams[team_index].name!)
                teamName.isHidden = true
                nextTeamAvailable = false
                teamName.textColor = .actionBlue
                customButton.backgroundColor = .actionBlue
                timerView.layer.opacity = 1
            }
            if !(timerCounting) {
                fieldPresenter.setPlayersInField(field: fieldView, club: teams[team_index].name!)
                UIView.animate(withDuration: 0.4, delay: 0, options:[.curveEaseIn], animations: {
                    self.feedbackBar.spheres[self.team_index].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    self.feedbackBar.spheres[self.team_index].sphere.backgroundColor = .actionBlue
                })
                
                if self.team_index > 0 {
                    UIView.animate(withDuration: 0.4, delay: 0, options:[.curveEaseIn], animations: {
                        self.feedbackBar.spheres[self.team_index - 1].transform = CGAffineTransform(scaleX: 1, y: 1)
                    })
                }
                teamName.text = teams[team_index].name!
                timerCounting = true
                timerView.isHidden = false
                count = 45
                timerView.text = "       0:\(count)"
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
                customButton.setTitle("Tentar", for: .normal)
            } else {
                UIView.animate(withDuration: 0.4, delay: 0, options:[.curveEaseInOut], animations: {
                    self.dimmingOverlay.layer.opacity = 0.6
                    self.textField.layer.opacity = 1
                    self.confirmButton.layer.opacity = 1
                })
            }
        }
        return true
    }
    
    @discardableResult @objc func confirmName() -> Bool {
        if textField.text?.lowercased().trimmingCharacters(in: .whitespaces).folding(options: .diacriticInsensitive, locale: .current) == teams[team_index].name!.lowercased().trimmingCharacters(in: .whitespaces).folding(options: .diacriticInsensitive, locale: .current) {
            textField.layer.borderColor = UIColor.actionGreen.cgColor
            textField.textColor = .actionGreen
            textField.tintColor = .actionGreen
            confirmButton.backgroundColor = .actionGreen
            teamName.textColor = .actionGreen
            customButton.backgroundColor = .actionGreen
            points += 1
            self.feedbackBar.spheres[self.team_index].sphere.backgroundColor = .actionGreen
            dismissAlert()
            showInfo()
            return true
        } else {
            textField.layer.borderColor = UIColor.actionRed.cgColor
            textField.textColor = .actionRed
            textField.tintColor = .actionRed
            confirmButton.backgroundColor = .actionRed
            do {
                try textField.shake(count: 4, for: 0.2, withTranslation: 3)
                try confirmButton.shake(count: 4, for: 0.2, withTranslation: 3)
            } catch {
                return false
            }
            return true
        }
        
    }
    
    @discardableResult @objc func timerCounter() -> Bool {
        if count > 1 {
            count = count - 1
            let time = secondsToMinutedSeconds(seconds: count)
            let timeString = makeTimeString(minutes: time.0, seconds: time.1)
            timerView.text = timeString
        } else {
            showInfo()
            teamName.textColor = .actionRed
            customButton.backgroundColor = .actionRed
            dismissAlert()
            self.feedbackBar.spheres[self.team_index].sphere.backgroundColor = .actionRed
            timerView.text = "       0:00"
        }
        return true
    }
    
    @discardableResult @objc func dismissAlert() -> Bool {
        UIView.animate(withDuration: 0.4, delay: 0, options:[.curveEaseInOut], animations: {
            self.dimmingOverlay.layer.opacity = 0
            self.textField.layer.opacity = 0
            self.confirmButton.layer.opacity = 0
        }){ _ in
            self.textField.text = ""
            self.textField.layer.borderColor = UIColor.actionBlue.cgColor
            self.textField.textColor = .actionBlue
            self.textField.tintColor = .actionBlue
            self.confirmButton.backgroundColor = .actionBlue
        }
        return true
    }
    
    @discardableResult func showInfo() -> Bool {
        timerCounting = false
        timer.invalidate()
        teamName.isHidden = false
        fieldPresenter.showNamesinField(field: fieldView)
        nextTeamAvailable = true
        timerView.layer.opacity = 0.6
        print(team_index)
        if team_index < 9 {
            customButton.setTitle("Próximo", for: .normal)
        } else {
            isLast = true
            UserDefaults.standard.set(points, forKey: "score")
            if UserDefaults.standard.integer(forKey: "highscore") < points {
                UserDefaults.standard.set(points, forKey: "highscore")
            }
            customButton.setTitle("Terminar", for: .normal)
        }
        return true
    }
    
    func secondsToMinutedSeconds(seconds: Int) -> (Int, Int) {
        return (((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString (minutes: Int, seconds: Int) -> String {
        var timeString = "       "
        timeString += String(format: "%01d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            
            timerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            timerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            timerView.heightAnchor.constraint(equalToConstant: 59),
            
            teamName.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 23),
            teamName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            fieldView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 80),
            fieldView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            fieldView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            
            customButton.topAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: 100),
            customButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            customButton.heightAnchor.constraint(equalToConstant: 59),
            
            feedbackBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            feedbackBar.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 30),
            
            dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30),
            textField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            textField.heightAnchor.constraint(equalToConstant: 59),
            
            confirmButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            confirmButton.widthAnchor.constraint(equalToConstant: 50),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
