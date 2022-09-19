//
//  RegisterScreen.swift
//  AppMusic
//
//  Created by Raphael Augusto on 18/09/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionRegisterButton()
}

class RegisterScreen: UIView, ConfigurableView {

    //MARK: - delegate
    private weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    //MARK: - Elements Visual
    private lazy var titleLabel: UILabel = {
        let lb            = UILabel()
        lb.text           = "Cadastro"
        lb.font           = UIFont.systemFont(ofSize: 48, weight: .medium)
        lb.textColor      = .white
        lb.textAlignment  = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var nameField: UITextField = {
        let tx = UITextField()
        tx.layer.cornerRadius          = 10
        tx.clipsToBounds               = true
        tx.layer.borderWidth           = 2
        tx.layer.borderColor           = UIColor.systemGray4.cgColor
        tx.textColor                   = .label
        tx.tintColor                   = .label
        tx.textAlignment               = .left
        tx.font                        = UIFont.preferredFont(forTextStyle: .title2)
        tx.adjustsFontSizeToFitWidth   = true
        tx.minimumFontSize             = 12
        tx.backgroundColor             = .tertiarySystemBackground
        tx.autocorrectionType          = .no
        tx.clearButtonMode             = .whileEditing
        tx.textContentType             = .emailAddress
        tx.returnKeyType               = .next
        tx.autocapitalizationType      = .none
        tx.keyboardType                = .emailAddress
        tx.attributedPlaceholder       = NSAttributedString(
                                            string: "Digite seu nome",
                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.585, green: 0.585, blue: 0.663, alpha: 1)] )
        tx.translatesAutoresizingMaskIntoConstraints = false
        
        tx.setLeftPaddingPoints(10)
        
        return tx
    }()
    
    lazy var emailField: UITextField = {
        let tx = UITextField()
        tx.layer.cornerRadius          = 10
        tx.clipsToBounds               = true
        tx.layer.borderWidth           = 2
        tx.layer.borderColor           = UIColor.systemGray4.cgColor
        tx.textColor                   = .label
        tx.tintColor                   = .label
        tx.textAlignment               = .left
        tx.font                        = UIFont.preferredFont(forTextStyle: .title2)
        tx.adjustsFontSizeToFitWidth   = true
        tx.minimumFontSize             = 12
        tx.backgroundColor             = .tertiarySystemBackground
        tx.autocorrectionType          = .no
        tx.clearButtonMode             = .whileEditing
        tx.textContentType             = .emailAddress
        tx.returnKeyType               = .next
        tx.autocapitalizationType      = .none
        tx.keyboardType                = .emailAddress
        tx.attributedPlaceholder       = NSAttributedString(
                                            string: "Digite seu email",
                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.585, green: 0.585, blue: 0.663, alpha: 1)] )
        tx.translatesAutoresizingMaskIntoConstraints = false
        
        tx.setLeftPaddingPoints(10)
        
        return tx
    }()
    
    lazy var passwordField: UITextField = {
        let tx = UITextField()
        tx.layer.cornerRadius          = 10
        tx.clipsToBounds               = true
        tx.layer.borderWidth           = 2
        tx.layer.borderColor           = UIColor.systemGray4.cgColor
        tx.textColor                   = .label
        tx.tintColor                   = .label
        tx.textAlignment               = .left
        tx.font                        = UIFont.preferredFont(forTextStyle: .title2)
        tx.adjustsFontSizeToFitWidth   = true
        tx.minimumFontSize             = 12
        tx.backgroundColor             = .tertiarySystemBackground
        tx.autocorrectionType          = .no
        tx.clearButtonMode             = .whileEditing
        tx.textContentType             = .password
        tx.returnKeyType               = .done
        tx.autocapitalizationType      = .none
        tx.isSecureTextEntry           = true
        tx.keyboardType                = .default
        tx.attributedPlaceholder       = NSAttributedString(
                                            string: "Digite sua senha",
                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.585, green: 0.585, blue: 0.663, alpha: 1)] )
        tx.translatesAutoresizingMaskIntoConstraints = false
        
        tx.setLeftPaddingPoints(10)
        
        
        return tx
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.configuration                       = .filled()
        btn.configuration?.cornerStyle          = .medium
        btn.configuration?.title                = "Registrar"
        btn.configuration?.baseBackgroundColor  = UIColor(red: 0.276, green: 0.388, blue: 0.946, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        
        return btn
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
        initView()
        initLayout()
    }
    
    public func configureTextFieldDelegate(delegete: UITextFieldDelegate) {
        self.nameField.delegate     = delegete
        self.emailField.delegate    = delegete
        self.passwordField.delegate = delegete
    }
    
    
    public func getName() -> String {
        return self.nameField.text ?? ""
    }
    
    public func getEmail() -> String {
        return self.emailField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordField.text ?? ""
    }
}


//MARK: - Components and Constraints
extension RegisterScreen {
    
    private func initView() {
        backgroundColor = UIColor(red: 25/245, green: 25/245, blue: 25/245, alpha: 1)
    }
    
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(nameField)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(registerButton)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
//            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            nameField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 50),

            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 60),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

//MARK: - Action
extension RegisterScreen: RegisterScreenProtocol {
    
    @objc func actionRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
}
