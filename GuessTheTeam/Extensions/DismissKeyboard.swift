//
//  DismissKeyboard.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 04/02/21.
//
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @discardableResult @objc func dismissKeyboard() -> Bool {
        view.endEditing(true)
        return true
    }
}
