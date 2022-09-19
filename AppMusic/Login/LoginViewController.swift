//
//  LoginViewController.swift
//  AppMusic
//
//  Created by Raphael Augusto on 14/09/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var loginScreen: LoginScreenView?
    var alert: Alert?
    var auth:Auth?
    
    override func loadView() {
        self.loginScreen = LoginScreenView()
        self.view   = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
        
        self.alert  = Alert(controller: self)
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configureTextFieldDelegate(delegete: self)
        
        self.auth       = Auth.auth()
    }
    
    
    func createDismissKeyboardTapGesture() {
         let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tap)
     }
}


//MARK: - TextField
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.loginScreen?.emailField {
            if !textField.validateEmail() {
                self.alert?.getAlert(title: "Atenção", message: "E-mail inválido, digite um e-mail valido.")
            }
        }

        if textField == self.loginScreen?.passwordField {
            if !textField.validatePassword() {
                self.alert?.getAlert(title: "Atenção", message: "Senha inválida, digite no mínimo 6 digitos.")
            }
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.loginScreen?.emailField {
            self.loginScreen?.passwordField.becomeFirstResponder()
        } else {
            self.loginScreen?.passwordField.resignFirstResponder()
        }
        
        
        return true
    }
}


//MARK: - actionButton
extension LoginViewController: LoginScreenViewProtocol {
    
    func actionLoginButton() {
        
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (user, error)  in

            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente.")
            } else {
                if user == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde.")
                }else{
                    let homeVC = HomeViewController()
                    let navVC  = UINavigationController(rootViewController: homeVC)
                    navVC.modalPresentationStyle = .fullScreen
                    self.present(navVC, animated: true, completion: nil)
                }
            }
        })
        
//        let email:String = self.loginScreen?.emailField.text ?? ""
//        let password:String = self.loginScreen?.passwordField.text ?? ""
//
//        if !email.isEmpty && !password.isEmpty {
//            let homeVC = HomeViewController()
//            let navVC  = UINavigationController(rootViewController: homeVC)
//            navVC.modalPresentationStyle = .fullScreen
//
//            self.present(navVC, animated: true, completion: nil)
//        }
    }
    
    
    func actionRegisterButton() {
        let registerVC = RegisterViewController()
        let navVC  = UINavigationController(rootViewController: registerVC)
        
        self.present(navVC, animated: true, completion: nil)
    }
}
