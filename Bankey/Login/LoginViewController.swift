//
//  ViewController.swift
//  Bankey
//
//  Created by K Praveen Kumar on 27/10/22.
//

import UIKit

protocol LogoutDelegate: AnyObject{
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let headingLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate : LoginViewControllerDelegate?
    
    var username: String?{
        return loginView.usernameTextField.text
    }
    
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if #available(iOS 15.0, *) {
            signInButton.configuration?.showsActivityIndicator = false
        } else {
            // Fallback on earlier versions
        }
    }
}

//MARK: - Style & Layouts
extension LoginViewController{
    
    private func style(){
        
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.text = "Bankey"
        headingLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 15.0, *) {
            signInButton.configuration = .filled()
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 15.0, *) {
            signInButton.configuration?.imagePadding = 8
        } else {
            // Fallback on earlier versions
        } // For indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Error Failure"
        errorMessageLabel.isHidden = true
        
        
    }
    private func layout(){
        view.addSubview(headingLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //HeadingView
        NSLayoutConstraint.activate([
            headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: headingLabel.bottomAnchor, multiplier: 4)
        ])
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), // 1 = 8pts
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        //Button (Always try to link the layout to nearer view)
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
        ])
        
        //Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController{
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username/password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Praveen" && password == "1234"{
            if #available(iOS 15.0, *) {
                signInButton.configuration?.showsActivityIndicator = true
                delegate?.didLogin()
            } else {
                // Fallback on earlier versions
            }
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
        
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}
