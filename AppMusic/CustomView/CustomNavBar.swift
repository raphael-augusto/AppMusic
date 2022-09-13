//
//  CustomNavBar.swift
//  AppMusic
//
//  Created by Raphael Augusto on 12/09/22.
//

import UIKit

class CustomNavBar: UIView, ConfigurableView {

    //MARK: - Elements Visual
    lazy var categoryTitle: UILabel = {
        let lb           = UILabel()
        lb.font          = UIFont.systemFont(ofSize: 12, weight: .bold)
        lb.textColor     = .white
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var cardTitle: UILabel = {
        let lb           = UILabel()
        lb.font          = UIFont.systemFont(ofSize: 20, weight: .bold)
        lb.textColor     = .white
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var featureLabel: UILabel = {
        let lb           = UILabel()
        lb.font          = UIFont.systemFont(ofSize: 12, weight: .bold)
        lb.textColor     = .white
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var cardImage: UIImageView = {
        let img           = UIImageView()
        img.contentMode   = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    lazy var overlayView: UIView = {
        let view             = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
extension CustomNavBar {
    
    func initSubviews() {
        addSubview(cardImage)
        addSubview(overlayView)
        addSubview(categoryTitle)
        addSubview(cardTitle)
        addSubview(featureLabel)
    }
    
    
    func initConstraints() {
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            cardTitle.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor,constant: 5),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            featureLabel.topAnchor.constraint(equalTo: cardTitle.bottomAnchor,constant: 5),
            featureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            featureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    
    public func setupView(data: CardViewModel) {
        self.cardTitle.text     = data.cardTitle
        self.categoryTitle.text = data.categoryName
        self.cardImage.image    = UIImage(named: data.cardImage ?? "")
        self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
}
