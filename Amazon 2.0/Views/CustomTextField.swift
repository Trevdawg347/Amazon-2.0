//
//  CustomTextField.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/9/21.
//

import UIKit

class CustomTextField: UITextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
            
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 30))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 30))
    }
}
