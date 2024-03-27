

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init()coder has not been implemented")
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        return imageView
    } ()
    

}
