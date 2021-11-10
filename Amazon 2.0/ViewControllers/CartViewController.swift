//
//  CartViewController.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/10/21.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func addConstraints() {
        scrollView.edgesToSuperview()
    }
}
