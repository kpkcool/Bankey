//
//  LoginView.swift
//  Bankey
//
//  Created by K Praveen Kumar on 27/10/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    let stackView = UIStackView()
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize{ //Make me 200*200 by default like intrinsic size of button/label
//        return CGSize(width: 200, height: 200)
//    }
}

extension LoginView{
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
    }
    
    func layout(){
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1), // 1 = 8pts, below topAnchor means loginView
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

//MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
