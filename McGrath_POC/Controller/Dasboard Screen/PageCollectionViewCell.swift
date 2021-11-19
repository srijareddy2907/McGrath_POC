//
//  PageCollectionViewCell.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 06/08/21.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageViewObj: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBOutlet weak var learnMoreBUtton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
