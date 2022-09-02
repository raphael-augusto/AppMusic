//
//  CardViewTableViewCell.swift
//  AppMusic
//
//  Created by Raphael Augusto on 02/09/22.
//

import UIKit

class CardViewTableViewCell: UITableViewCell, ConfigurableView  {

    static let identifier: String = "CardViewTableViewCell"
    
    //MARK: - Elements Visual
    private lazy var cardView: CustomCardView = {
        let view            = CustomCardView()
        view.clipsToBounds  = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Init Components
    private func setup() {
        initLayout()
    }
}


//MARK: - Components and Constraints
extension CardViewTableViewCell {
    
    func initSubviews() {
        contentView.addSubview(cardView)
    }
    
    
    func initConstraints() {
        cardView.pin(to: self)
    }
    
    
    public func setupCell(data: CardViewModel) {
        self.cardView.setupView(data: data)
    }
}
