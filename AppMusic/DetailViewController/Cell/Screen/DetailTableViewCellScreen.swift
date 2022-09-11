//
//  DetailTableViewCellScreen.swift
//  AppMusic
//
//  Created by Raphael Augusto on 10/09/22.
//

import UIKit

class DetailTableViewCellScreen: UIView, ConfigurableView  {

    //MARK: - Elements Visual
    private lazy var thumbImage: UIImageView = {
        let img                 = UIImageView()
        img.image               = UIImage(named: "demo")
        img.layer.cornerRadius  = 5
        img.clipsToBounds       = true
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()

    private lazy var title: UILabel = {
        let lb       = UILabel()
        lb.text      = "Teste Nome"
        lb.font      = UIFont.systemFont(ofSize: 17, weight: .bold)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    private lazy var subTitle: UILabel = {
        let lb       = UILabel()
        lb.text      = "Sub Titulo"
        lb.font      = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lb.textColor = .lightGray
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
extension DetailTableViewCellScreen {
    
    func initSubviews() {
        addSubview(thumbImage)
        addSubview(title)
        addSubview(subTitle)
        addSubview(likeButton)
        addSubview(moreButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 60),
            thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: topAnchor,constant: 17),
            
            subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            moreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: 35),
            moreButton.heightAnchor.constraint(equalToConstant: 35),
            
            likeButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -15),
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 35),
            likeButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    
    public func setupCell(data: CardListModel) {
        self.title.text       = data.listTitle
        self.subTitle.text    = data.listSubtitle
        self.thumbImage.image = UIImage(named: data.listImage ?? "")
    }
}
