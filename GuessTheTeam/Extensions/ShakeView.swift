//
//  ShakeView.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 04/02/21.
//

import UIKit


public extension UIView {
    
    enum InputErrors: Error {
        case badCountNumber
        case badDuration
        case badTranslation
    }

    func shake (count: Float = 4, for duration: TimeInterval = 0.5, withTranslation translation: Float = 5) throws {
        if count <= 0 { throw InputErrors.badCountNumber }
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
