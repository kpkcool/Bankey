//
//  MainViewController.swift
//  Bankey
//
//  Created by K Praveen Kumar on 01/11/22.
//

import UIKit

class MainVewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews(){
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewViewController()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC,moneyNC,moreNC]
        self.viewControllers = tabBarList
        
    }
    
    //To hide the one pixel line that appears under the navigation bar
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar(){
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}
class MoveMoneyViewController: UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}
class MoreViewViewController: UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
