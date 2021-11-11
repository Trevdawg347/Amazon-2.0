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

    private var keyboardShowing: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextFields
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        confirmPasswordTextField.returnKeyType = .done
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func handleKeyboard(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if notification.name == UIResponder.keyboardDidShowNotification && !keyboardShowing {
                keyboardShowing = true
                contentViewHeight.constant += keyboardSize.height
            } else if notification.name == UIResponder.keyboardDidHideNotification && keyboardShowing {
                keyboardShowing = false
                contentViewHeight.constant = 0
            }
            view.layoutIfNeeded()
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
