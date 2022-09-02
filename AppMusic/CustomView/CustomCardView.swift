//
//  CustomCardView.swift
//  AppMusic
//
//  Created by Raphael Augusto on 02/09/22.
//

import UIKit

enum ViewMode {
    case full
    case card
}

class CustomCardView: UIView, ConfigurableView {
    
    //MARK: - Properties
    var vmode: ViewMode?
    var dataModel:CardViewModel?
    
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?

    
    //MARK: - Elements Visual
    private lazy var cardContainerView: UIView = {
        let view                    = UIView()
        view.layer.cornerRadius     = 30
        view.layer.shadowOpacity    = 1
        view.layer.shadowOffset     = CGSize(width: 0, height: -2)
        view.layer.shadowRadius     = 20
        view.clipsToBounds          = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var cardImage: UIImageView = {
        let image               = UIImageView()
        image.contentMode       = .scaleAspectFill
        image.backgroundColor   = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var overlayView: UIView = {
        let view               = UIView()
        view.backgroundColor   = UIColor.black.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var profileBorderView: UIView = {
        let view                = UIView()
        view.backgroundColor    = .clear
        view.layer.borderWidth  = 1
        view.layer.borderColor  = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var cardProfilePicture: UIImageView = {
        let image                = UIImageView()
        image.contentMode        = .scaleAspectFill
        image.backgroundColor    = .black
        image.clipsToBounds      = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var addProfileImageButton: UIButton = {
        let button                  = UIButton()
        button.backgroundColor      = .white
        button.layer.cornerRadius   = 10
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var cardCategoryTitleLabel: UILabel = {
        let label       = UILabel()
        label.font      = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cardCategoryDateLabel: UILabel = {
        let label       = UILabel()
        label.font      = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cardTitleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor     = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var likeAndTimeLabel: UILabel = {
        let label           = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor     = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Init
    init() {
        let frame = CGRect.zero
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
extension CustomCardView {
    
    func initSubviews() {
        addSubview(cardContainerView)
        cardContainerView.addSubview(cardImage)
        cardContainerView.addSubview(overlayView)
        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(cardProfilePicture)
        cardContainerView.addSubview(addProfileImageButton)
        cardContainerView.addSubview(cardCategoryTitleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardTitleLabel)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        
        updateLayout(for: vmode ?? .card)
    }

    
    func initConstraints() {
        self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        self.containerLeadingConstraints?.isActive = true
        
        self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        self.containerTopConstraints?.isActive = true
        
        self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        self.containerBottomConstraints?.isActive = true
        
        self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        self.containerTrailingConstraints?.isActive = true
        
        self.overlayView.pin(to: cardContainerView)
        self.cardImage.pin(to: cardContainerView)
        
        NSLayoutConstraint.activate([
            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            addProfileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            cardProfilePicture.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            cardProfilePicture.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),
            cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            cardCategoryTitleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: cardCategoryTitleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardTitleLabel.topAnchor.constraint(equalTo: cardCategoryDateLabel.bottomAnchor, constant: 20),
            cardTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            cardTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            
            likeAndTimeLabel.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40),
        ])
    }
    
    
    private func updateLayout(for mode: ViewMode) {
        if mode == .full {
            self.containerLeadingConstraints?.constant  = 0
            self.containerTopConstraints?.constant      = 0
            self.containerTrailingConstraints?.constant = 0
            self.containerBottomConstraints?.constant   = 0
            self.descriptionTitleLabel.isHidden         = false
        } else {
            self.containerLeadingConstraints?.constant  = 30
            self.containerTopConstraints?.constant      = 15
            self.containerTrailingConstraints?.constant = -30
            self.containerBottomConstraints?.constant   = -15
            self.descriptionTitleLabel.isHidden         = true
        }
    }
    
    public func setupView(data: CardViewModel) {
        cardCategoryTitleLabel.text     = data.categoryName
        cardCategoryDateLabel.text      = data.categoryDate
        cardTitleLabel.text             = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text      = data.cardDescription
        cardImage.image                 = UIImage(named: data.cardImage ?? "")
        cardProfilePicture.image        = UIImage(named: data.categoryImage ?? "")
    }
}
