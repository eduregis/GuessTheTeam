//
//  FeedbackSphere.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 04/02/21.
//

import UIKit

class FeedbackSphere: UIView {
    
    lazy var sphere: UIView = {
        let sphere = UIView()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        sphere.layer.cornerRadius = 10
        sphere.backgroundColor = .ivory
        self.addSubview(sphere)
        return sphere
    }()
    
    init() {
        super.init(frame: .zero)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            sphere.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sphere.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            sphere.widthAnchor.constraint(equalToConstant: 20),
            sphere.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
}
