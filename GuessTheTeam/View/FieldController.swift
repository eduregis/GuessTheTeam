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
    
    init() {
        self.fieldPresenter = FieldPresenter()
        super.init(nibName: nil, bundle: nil)
        configureLayout()
        self.view.backgroundColor = UIColor.backgroundPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var fieldView: FieldView = {
        let field = FieldView()
        field.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(field)
        return field
    }()
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            fieldView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            fieldView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            fieldView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
        ])
    }
                                    
    
    
}
