//
//  ViewController.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 30/06/23.
//

import UIKit
import FirebaseAuth
class LoginVC: UIViewController {
    private var loginScreen:LoginScreen?
    
    private var auth: Auth?
    
    private var alert:AlertController?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldsDelegate(delegate: self)
        dismissKeyBoard()
        isEnableLoginButton(false)
        
        alert = AlertController(controller: self)
        loginScreen?.emailTextField.text = "Ednaldo@gmail.com"
        loginScreen?.passwordTextField.text = "123456"
    }
    
    func validateTextFields(){
        if  (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) &&
                (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableLoginButton(true)
        } else {
            isEnableLoginButton(false)
        }
        
    }
    
    func isEnableLoginButton(_ isEnable: Bool) {
        if isEnable {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.subImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.4
        }
    }
}

extension LoginVC:LoginScreenProtocol {
    func tappedLogin() {
        self.auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion:{ user, error in
            if error == nil {
               print("Success login")
            } else {
                print(error?.localizedDescription)
                self.alert?.getAlert(title: "Falha no Login", message: error?.localizedDescription ?? "", completion: {
                    print("Button pressed")
                })
            }
        })
    }
}

extension LoginVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1.0
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                    
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.0
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                loginScreen?.emailTextField.layer.borderWidth = 1.0
                loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                loginScreen?.passwordTextField.layer.borderWidth = 1.0
                loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
            }
        }
        
        validateTextFields()
    }
    
    
}

