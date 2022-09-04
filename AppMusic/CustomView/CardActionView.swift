//
//  CardActionView.swift
//  AppMusic
//
//  Created by Raphael Augusto on 02/09/22.
//

import UIKit

class CardActionView: UIView, ConfigurableView  {

    //MARK: - Elements Visual
    private lazy var stackView: UIStackView = {
        let stack           = UIStackView()
        stack.axis          = .horizontal
        stack.distribution  = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var downloadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var notInterestedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var playView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var downloadButton: UIButton = {
        let button                  = UIButton()
        button.backgroundColor      = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius   = 22.5
        button.tintColor            = .white
        button.clipsToBounds        = true
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame )
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
extension CardActionView {
    
    func initSubviews() {
        <#code#>
    }
    
    
    func initConstraints() {
        <#code#>
    }
}
