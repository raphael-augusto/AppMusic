//
//  LoginScreenView.swift
//  AppMusic
//
//  Created by Raphael Augusto on 14/09/22.
//

import UIKit

protocol LoginScreenViewProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

final class LoginScreenView: UIView, ConfigurableView {

    //MARK: - delegate
    private weak var delegate: LoginScreenViewProtocol?
    
    func delegate(delegate: LoginScreenViewProtocol?) {
        self.delegate = delegate
    }
    
    //MARK: - Elements Visual
    private lazy var titleLabel: UILabel = {
        let lb            = UILabel()
        lb.text           = "Bem-vindo ao music 👋"
        lb.font           = UIFont.systemFont(ofSize: 32, weight: .medium)
        lb.textColor      = .white
        lb.textAlignment  = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    private lazy var titleDescription: UILabel = {
        let lb           = UILabel()
        lb.text          = "Vamos fazer login?"
        lb.font          = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.textColor     = .white
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    private lazy var stack: UIStackView = {
        let st  = UIStackView()
        st.axis = .horizontal
        st.translatesAutoresizingMaskIntoConstraints = false
        
        return st
    }()
    
    private lazy var titleRegister: UILabel = {
        let lb           = UILabel()
        lb.text          = "Não tem conta?"
        lb.font          = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor     = .white
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    private lazy var createUserButton: UIButton = {
        let btn                                 = UIButton()
        btn.configuration                       = .filled()
        btn.configuration?.cornerStyle          = .medium
        btn.configuration?.title                = "Criar"
        btn.configuration?.baseBackgroundColor  = UIColor.black.withAlphaComponent(0.0)
        btn.configuration?.baseForegroundColor  = UIColor(red: 70/245, green: 99/245, blue: 241/245, alpha: 1)
        btn.configuration?.imagePadding         = 6
        btn.configuration?.imagePlacement       = .leading

        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return btn
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
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.configuration                       = .filled()
        btn.configuration?.cornerStyle          = .medium
        btn.configuration?.title                = "Entrar"
        btn.configuration?.baseBackgroundColor  = UIColor(red: 0.276, green: 0.388, blue: 0.946, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var forgotButton: UIButton = {
        let btn = UIButton()
        btn.configuration                       = .filled()
        btn.configuration?.cornerStyle          = .medium
        btn.configuration?.title                = "Esqueci minha senha"
        btn.configuration?.baseBackgroundColor  = UIColor.black.withAlphaComponent(0.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.emailField.delegate    = delegete
        self.passwordField.delegate = delegete
    }
    
    public func getEmail() -> String {
        return self.emailField.text ?? ""
    }
    
    
    public func getPassword() -> String {
        return self.passwordField.text ?? ""
    }

}


//MARK: - Components and Constraints
extension LoginScreenView {
    
    private func initView() {
        backgroundColor = UIColor(red: 25/245, green: 25/245, blue: 25/245, alpha: 1)
    }
    
    
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(titleDescription)
        addSubview(stack)
        stack.addArrangedSubview(titleRegister)
        stack.addArrangedSubview(createUserButton)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(forgotButton)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 190),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            titleDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            emailField.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            stack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            forgotButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            forgotButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}


//MARK: - Action
extension LoginScreenView {
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
}
