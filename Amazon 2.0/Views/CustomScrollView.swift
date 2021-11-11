//
//  CustomScrollView.swift
//  Amazon 2.0
//
//  Created by Forrest Buhler on 11/10/21.
//

import UIKit

class CustomScrollView: UIScrollView {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delaysContentTouches = false
        keyboardDismissMode = .interactive
        showsVerticalScrollIndicator = false
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton || view is UITextField {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
    
    
}
