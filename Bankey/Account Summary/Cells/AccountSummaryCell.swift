//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by K Praveen Kumar on 02/11/22.
//

import UIKit

class AccountSummaryCell : UITableViewCell{
    
    
    enum AccountType: String{
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel{
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        
        var balanceAsArributedString: NSAttributedString{
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    //This is historically how storyboard gets loaded.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell{
    private func setup(){
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account Type"
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account Name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 2
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Some balance"
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
//        balanceAmountLabel.text = "$929,466.63"
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "XXX,XXX", cents: "XX")
        balanceAmountLabel.textAlignment = .right
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        
        
        contentView.addSubview(typeLabel) //ContentView of a UITableViewCell object is the default superview for content that the cell displays.
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    private func layout(){
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
        
            
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: underlineView.leadingAnchor),
            
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 2),
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
            
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 5),
            balanceStackView.topAnchor.constraint(equalTo: underlineView.topAnchor)
            
        ])
    }
    
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString{
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        return rootString
    }
    
}

extension AccountSummaryCell {
    
    func configure(with vm: ViewModel){
        
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsArributedString
        
        switch vm.accountType{
        case .Banking:
            underlineView.backgroundColor = appColor
            balanceLabel.text = "Current balance"
            break
        case .CreditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Balance"
            break
        case .Investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
            break
        }
    }
}
