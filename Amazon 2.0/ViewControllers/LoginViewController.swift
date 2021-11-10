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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.addAction(UIAction() { [weak self] _ in
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "Tab")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self?.present(vc, animated: true)
        }, for: .touchUpInside)
    }
}
