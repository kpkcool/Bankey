//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by K Praveen Kumar on 30/10/22.
//

import UIKit

class OnboardingViewController : UIViewController{
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let imageName : String
    let titleText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(imageName: String, titleText: String){
        self.imageName = imageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController{
    func style(){
        
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: self.imageName)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.titleText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
    }
    func layout(){
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
