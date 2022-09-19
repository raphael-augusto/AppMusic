//
//  RegisterViewController.swift
//  AppMusic
//
//  Created by Raphael Augusto on 18/09/22.
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {
        
    var registerScreen: RegisterScreen?
    
    var firastore: Firestore?
    var auth:Auth?
    
    var alert: Alert?
    
        
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view   = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alert  = Alert(controller: self)
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configureTextFieldDelegate(delegete: self)
        
        self.auth       = Auth.auth()
    }
}


//MARK: - TextField
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.registerScreen?.emailField {
            if !textField.validateEmail() {
                self.alert?.getAlert(title: "Atenção", message: "Digite um e-mail valido.")
            }
        }

        
        if textField == self.registerScreen?.passwordField {
            if !textField.validatePassword() {
                self.alert?.getAlert(title: "Senha", message: "Digite no mínimo 6 digitos.")
            }
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.registerScreen?.nameField {
            self.registerScreen?.emailField.becomeFirstResponder()
        } else if textField == self.registerScreen?.emailField {
            self.registerScreen?.passwordField.becomeFirstResponder()
        } else {
            self.registerScreen?.passwordField.resignFirstResponder()
        }
        
        return true
    }
}


extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else { return }
        
        //authentication
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Error ao cadastrar")
            } else {
                
                //fireStore - create dataBase (user)
                if let idUsuario = result?.user.uid {
                    self.firastore?.collection("usuarios").document(idUsuario).setData([
                        "nome": self.registerScreen?.getName() ?? "",
                        "email": self.registerScreen?.getEmail() ?? "",
                        "id": idUsuario
                    ])
                }
                
                self.alert?.getAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso.", completion: {
                    self.dismiss(animated: true, completion: nil)
                })
            }
        })
    }
}
