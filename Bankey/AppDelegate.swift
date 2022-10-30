//
//  AppDelegate.swift
//  Bankey
//
//  Created by K Praveen Kumar on 27/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
//        window?.rootViewController = loginViewController
        window?.rootViewController = onboardingContainerViewController
        
        return true
    }
}
extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        print("Did Login")
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        print("Did finish onboarding")
    }
    

}


