//
//  DetailTableViewCell.swift
//  AppMusic
//
//  Created by Raphael Augusto on 10/09/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell, ConfigurableView {
    
    //MARK: - Identifier Cell and Properties
    static public let identifier:String = "DetailTableViewCell"
    
    
    //MARK: - Elements Visual
    private lazy var screen: DetailTableViewCellScreen = {
        let cell = DetailTableViewCellScreen()
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
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
extension DetailTableViewCell {
    
    func initSubviews() {
        contentView.addSubview(screen)
    }
    
    
    func initConstraints() {
        screen.pin(to: self.contentView)
    }
    
    
    public func setupCell(data: CardListModel) {
        self.screen.setupCell(data: data)
    }
}
