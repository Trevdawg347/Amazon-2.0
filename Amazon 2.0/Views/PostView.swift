//
//  PostView.swift
//  Amazon 2.0
//
//  Created by Forrest Buhler on 11/9/21.
//

import UIKit
import TinyConstraints

class PostView: UICollectionViewCell {

    static let identifier = "post"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup(title: Bool) {
                
        if title {
        label.text = "$100,000"
        } else {
            label.text = "$10"
        }
        
        imageView.image = UIImage(systemName: "trash.square.fill")
        imageView.backgroundColor = .cyan
        
    }
    
    override func prepareForReuse() {
        self.label.text = nil
        self.imageView.image = nil
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PostView", bundle: nil)
    }

}
