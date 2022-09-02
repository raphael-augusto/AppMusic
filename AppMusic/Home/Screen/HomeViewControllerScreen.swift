//
//  HomeViewControllerScreen.swift
//  AppMusic
//
//  Created by Raphael Augusto on 31/08/22.
//

import UIKit

class HomeViewControllerScreen: UIView, ConfigurableView {
    
    //MARK: - Elements Visual
    private lazy var tableView: UITableView = {
        let tv                          = UITableView()
        tv.separatorStyle               = .none
        tv.tableFooterView              = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Init - Components
    private func setup () {
        initLayout()
    }
}

//MARK: - Components and Constraints
extension HomeViewControllerScreen {
    
    func initSubviews() {
        addSubview(tableView)
    }
    
    
    func initConstraints() {
        self.tableView.pin(to: self)
    }
}


//MARK: - Delegate and DataSource
extension HomeViewControllerScreen {
    
    public func configureTableViewProtocolos(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate     = delegate
        self.tableView.dataSource   = dataSource
    }
}
