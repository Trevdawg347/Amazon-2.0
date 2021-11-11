//
//  CreateAccountViewController.swift
//  Amazon 2.0
//
//  Created by Forrest Buhler on 11/10/21.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var createAccountButton: UIButton!

    private var keyboardShowing: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        //Notify when keyboard appears or dissappears
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Remove observer
        NotificationCenter.default.removeObserver(self)
    }
        
    override func viewDidLoad() {

        
        super.viewDidLoad()
    
        //Create Account
        createAccountButton.addAction(UIAction() { _ in
            self.view.endEditing(true)
        }, for: .touchUpInside)
        

        
        //TextFields
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.delegate = self
        confirmPasswordTextField.returnKeyType = .done
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    @objc func handleKeyboard(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if notification.name == UIResponder.keyboardDidShowNotification && !keyboardShowing {
                keyboardShowing = true
                contentViewHeight.constant += keyboardSize.height
                view.layoutIfNeeded()
            } else if notification.name == UIResponder.keyboardDidHideNotification && keyboardShowing {
                keyboardShowing = false
                contentViewHeight.constant = 0
                view.layoutIfNeeded()
            }
            
        }
    }
}

extension CreateAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        if textField.returnKeyType == .done {
            // Create Account
            
        } else {
            // Move to Next Field
             if let nextField = view.viewWithTag(textField.tag + 1) as? CustomTextField {
                nextField.becomeFirstResponder()
            }
        }
        
        return true
    }
    
}
