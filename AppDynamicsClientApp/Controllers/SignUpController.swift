//
//  SignUpController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/9/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class SignUpController: UIViewController {
    
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: DesignableTextField!
    @IBOutlet weak var lastNameTextField: DesignableTextField!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var repeatPasswordTextField: DesignableTextField!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var signUpButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "sdf"
        mainView.layer.cornerRadius = 20
    }
    
    @IBAction func firstNameEditingBegin(_ sender: Any) {
        firstNameTextField.backgroundColor = firstNameTextField.normalBackgroundColor
        firstNameTextField.placeholder = "First Name"
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let user = User()
        
        if let firstName = firstNameTextField.text, firstName != "" {
            user.firstName = firstName
        } else {
            firstNameTextField.backgroundColor = firstNameTextField.errorBackgroundColor
            firstNameTextField.placeholder = "Required."
            animate(textField: firstNameTextField)
        }
        if let lastName = lastNameTextField.text, lastName != "" {
            user.lastName = lastName
        } else {
            lastNameTextField.backgroundColor = lastNameTextField.errorBackgroundColor
            lastNameTextField.placeholder = "Required."
            animate(textField: lastNameTextField)
        }
        if let email = emailTextField.text, email != "" {
            user.email = email
        } else {
            emailTextField.backgroundColor = emailTextField.errorBackgroundColor
            emailTextField.placeholder = "Email required."
            animate(textField: emailTextField)
        }
        if let password = passwordTextField.text, password != "" {
            if let repeatPassword = repeatPasswordTextField.text, repeatPassword != "" {
                if password == repeatPassword {
                    user.password = password
                } else{
                    repeatPasswordTextField.text = ""
                    repeatPasswordTextField.backgroundColor = repeatPasswordTextField.errorBackgroundColor
                    repeatPasswordTextField.placeholder = "Passowrd must match."
                    animate(textField: repeatPasswordTextField)
                }
            } else {
                repeatPasswordTextField.backgroundColor = repeatPasswordTextField.errorBackgroundColor
                repeatPasswordTextField.placeholder = "Passowrd must match."
                animate(textField: repeatPasswordTextField)
            }
        } else {
            passwordTextField.backgroundColor = passwordTextField.errorBackgroundColor
            passwordTextField.placeholder = "Password required."
            animate(textField: passwordTextField)
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
        
    }
    
    func animate(textField: DesignableTextField) {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x += 10
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x -= 20
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x += 10
        }, completion: nil)
    }
}
