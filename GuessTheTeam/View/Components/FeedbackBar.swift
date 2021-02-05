//
//  FeedbackBar.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 04/02/21.
//
import UIKit

class FeedbackBar: UIView {
    
    var spheres: [FeedbackSphere] = []
    
    lazy var sphere_01: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_02: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_03: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_04: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_05: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_06: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_07: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_08: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_09: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var sphere_10: FeedbackSphere = {
        let sphere = FeedbackSphere()
        sphere.translatesAutoresizingMaskIntoConstraints = false
        return sphere
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [sphere_01, sphere_02, sphere_03, sphere_04, sphere_05, sphere_06, sphere_07, sphere_08, sphere_09, sphere_10])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 35
        self.addSubview(stack)
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        spheres.append(sphere_01)
        spheres.append(sphere_02)
        spheres.append(sphere_03)
        spheres.append(sphere_04)
        spheres.append(sphere_05)
        spheres.append(sphere_06)
        spheres.append(sphere_07)
        spheres.append(sphere_08)
        spheres.append(sphere_09)
        spheres.append(sphere_10)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}
