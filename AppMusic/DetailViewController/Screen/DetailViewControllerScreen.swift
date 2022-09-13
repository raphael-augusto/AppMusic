//
//  DetailViewControllerScreen.swift
//  AppMusic
//
//  Created by Raphael Augusto on 09/09/22.
//

import UIKit

protocol DetailViewControllerScreenDelegate: AnyObject {
    func tappedCloseButton()
}

class DetailViewControllerScreen: UIView, ConfigurableView {
    
    //MARK: - Properties
    var cardModel:CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    

    //MARK: - Properties Delegate
    private weak var delegate: DetailViewControllerScreenDelegate?
    
    
    //MARK: - Elements Visual
    private lazy var scrollView: UIScrollView = {
        let scroll                            = UIScrollView(frame: .zero)
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator   = false
        scroll.autoresizingMask               = .flexibleHeight
        scroll.bounces                        = false
        scroll.clipsToBounds                  = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private lazy var cardView: CustomCardView = {
        let card = CustomCardView(mode: .full)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.cardContainerView.layer.cornerRadius = 0.0
        card.setupView(data: self.cardModel ?? CardViewModel())
        
        return card
    }()
    
    private lazy var navBar: CustomNavBar = {
        let nb = CustomNavBar()
        nb.backgroundColor = .black
        nb.translatesAutoresizingMaskIntoConstraints = false
        
        nb.setupView(data: self.cardModel ?? CardViewModel())
        
        return nb
    }()
    
    private lazy var tableView: UITableView = {
        let tv                          = UITableView()
        tv.tableFooterView              = UIView()
        tv.separatorStyle               = .none
        tv.showsVerticalScrollIndicator = false
        tv.isScrollEnabled              = false
        tv.contentInset                 = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        tv.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        
        return tv
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 15
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    //MARK: - Init
    init(dataView:CardViewModel?) {
        super.init(frame: CGRect())
        self.cardModel = dataView
        
        DispatchQueue.main.async {
            self.setup()
        }
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
extension DetailViewControllerScreen {
    
    func initSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(tableView)
        addSubview(navBar)
        addSubview(closeButton)
    }
    
    func initConstraints() {
        
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        

        scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(topPadding ?? 0)),
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: cardView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: ((topPadding ?? 0.0) + 80))
        ])
        
        self.navBarTopAnchor = self.navBar.topAnchor.constraint(equalTo: self.topAnchor, constant: -((topPadding ?? 0.0) + 60))
        self.navBarTopAnchor?.isActive = true
    }
}


//MARK: - Delegate
extension DetailViewControllerScreen {
    
    public func configAllDelegate(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailViewControllerScreenDelegate) {
        self.tableView.delegate   = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
        self.scrollView.delegate  = scrollViewDelegate
        self.delegate             = detailViewScreenDelegate
    }
}


//MARK: - Action button
extension DetailViewControllerScreen {
    
    @objc func closePressed() {
        self.delegate?.tappedCloseButton()
    }
}
