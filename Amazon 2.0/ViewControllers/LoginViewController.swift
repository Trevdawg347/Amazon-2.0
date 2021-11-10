//
//  LoginViewController.swift
//  Amazon 2.0
//
//  Created by Forrest Buhler on 11/9/21.
//

import UIKit

class LoginViewController: UIViewController {
    private let fb = Firebase.shared
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Textfields
        emailTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
        
        //Login Button
        self.loginButton.addAction(UIAction() { [weak self] _ in
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "Tab")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self?.present(vc, animated: true)
        }, for: .touchUpInside)

    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
        textField.endEditing(true)
        if textField.placeholder == "Email" {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.fb.isSignedIn = true
        }
        
        return true
    }
}
