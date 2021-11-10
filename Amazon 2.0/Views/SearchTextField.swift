//
//  CustomTextField.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/9/21.
//

import UIKit

class SearchTextField: UITextField {
    
    private let imageView = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(imageView)
        self.imageView.image = UIImage(systemName: "magnifyingglass")
        self.imageView.tintColor = .systemGray
        addConstraints()
    }
    
    private func addConstraints() {
        imageView.height(25)
        imageView.width(25)
        imageView.leadingToSuperview(offset: 5)
        imageView.centerYToSuperview()
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
    }
    
}
