//
//  CartView.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/10/21.
//

import UIKit

class CartView: UICollectionViewCell {
    
    static let identifier = "cart"
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func setup() {
        label.text = "This is my title hopefully this works."
        imageView.backgroundColor = .blue
    }
    
    override func prepareForReuse() {
        label.text = nil
        imageView.image = nil
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CartView", bundle: nil)
    }

}
