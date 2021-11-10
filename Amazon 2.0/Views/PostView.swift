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
        self.contentView.width(UIScreen.main.bounds.width)
        self.contentView.bottom(to: label)
    }
    
    public func setup() {
                
        label.text = "HI bro how's it going, HI bro how's it goingHI bro how's it goingHI bro how's it goingHI bro how's it goingHI bro how's it goingHI bro how's it goingHI bro how's it goingHI bro how's it going"
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        
    }
    
    override func prepareForReuse() {
        self.label.text = nil
        self.imageView.image = nil
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PostView", bundle: nil)
    }

}
