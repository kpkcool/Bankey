//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by K Praveen Kumar on 01/11/22.
//

import UIKit


class AccountSummaryViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
extension AccountSummaryViewController{
    func style(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = .preferredFont(forTextStyle: .title2)
        
    }
    func layout(){
        
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
