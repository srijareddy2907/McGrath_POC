//
//  DealItemsCollectionViewCell.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 05/08/21.
//

import UIKit

class DealItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imagesView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var getLocationButton: UIButton!
    
    @IBAction func getQuoteButton(_ sender: Any)
    {
        
    }
    
    @IBAction func getLOcationButton(_ sender: Any)
    {
        
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBG.layer.cornerRadius = 15
        viewBG.clipsToBounds = true
        viewBG.layer.masksToBounds = false
        viewBG.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        viewBG.layer.shadowRadius = 7
//        viewBG.layer.shadowOpacity = 0.6
//        viewBG.layer.shadowOffset = CGSize(width: 0, height: 5)
//        viewBG.layer.shadowColor = UIColor.gray.cgColor
        
        getLocationButton.layer.cornerRadius = 5
        likeButton.layer.cornerRadius = likeButton.frame.height/2
        imagesView.layer.cornerRadius = 10
    }
    //check button tapped function for select/deselect
    func myButtonTapped(button:UIButton){
      if button.isSelected == true {
        button.isSelected = false
        button.setImage(UIImage(named: "Heart-light"), for: UIControl.State.normal)
      }else {
        button.isSelected = true
        button.setImage(UIImage(named: "Heart"), for: UIControl.State.normal)
      }
    }

    @IBAction func likeButton(_ sender: Any)
    {
        myButtonTapped(button: likeButton)
    }
}
