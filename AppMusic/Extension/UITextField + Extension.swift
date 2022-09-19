//
//  UITextField + Extension.swift
//  AppMusic
//
//  Created by Raphael Augusto on 16/09/22.
//

import UIKit

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return validateRegex.evaluate(with: self.text)
    }
    
    
    func validatePassword()  -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        return validateRegex.evaluate(with: self.text)
    }
}
