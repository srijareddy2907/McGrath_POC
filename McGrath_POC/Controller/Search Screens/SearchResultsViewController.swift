//
//  SearchResultsViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 06/08/21.
//

import UIKit

class SearchResultsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    @IBOutlet weak var searchChipsView: UIView!

    var imageArray:[String] = ["image","image","image","image","image"]//images array for collection view
    var products:[String] = ["product1","product2","product3","product4"]
    var productName:[String] = ["Modular office","modular classroom","Modular office","Modular office"]
    var size:[String] = ["10'*40'","18'*24","10'*40","10'*40"]
    var searchResultArray:[String] = Array()//array to store all search filters
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("search Result view controller - \(searchResultArray)")
        createTagCloud(OnView: self.searchChipsView, withArray: self.searchResultArray as [AnyObject])//creating the cloud chips

        //collection view search results - products
        searchResultCollectionView.register(UINib(nibName: "DealItemsCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "DealItemsCollectionViewCell")
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
      
    }
    
    //CollectionView//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = searchResultCollectionView.dequeueReusableCell(withReuseIdentifier: "DealItemsCollectionViewCell", for: indexPath) as! DealItemsCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.imagesView.image = UIImage(named: products[indexPath.row])
        cell.nameLabel.text = productName[indexPath.row]
        cell.sizeLabel.text = size[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == searchResultCollectionView
        {
            return CGSize(width: 180, height: 290)
        }
        else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    //creating chips
    func createTagCloud(OnView view: UIView, withArray data:[AnyObject])
    {
             for tempView in view.subviews {
                 if tempView.tag != 0 {
                     tempView.removeFromSuperview()
                 }
             }
             var xPos:CGFloat = 10.0
             var ypos: CGFloat = 10.0

             var tag: Int = 1
             for str in data  {
                 let startstring = str as! String
                 let width = startstring.widthOfString(usingFont: UIFont(name:"verdana", size: 13.0)!)
                 let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(7.0) + CGFloat(25.5)//7.0 is the width between lable and cross button and 25.5 is cross button width and gap to righht
                 if checkWholeWidth > UIScreen.main.bounds.size.width - 20.0 {
                     //we are exceeding size need to change xpos
                     xPos = 10.0
                     ypos = ypos + 29.0 + 8.0
                 }
                //chips background view
                 let bgView = UIView(frame: CGRect(x: xPos, y: ypos, width:width + 17.0 + 38.5 , height: 29.0))
                 bgView.layer.cornerRadius = 14.5
                 bgView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                 bgView.tag = tag
                //chip text
                 let textlable = UILabel(frame: CGRect(x: 17.0, y: 0.0, width: width, height: bgView.frame.size.height))
                 textlable.font = UIFont(name: "verdana", size: 13.0)
                 textlable.text = startstring
                 textlable.textColor = UIColor.black
                 bgView.addSubview(textlable)
                //cancle button in chip
                 let button = UIButton(type: .custom)
                 button.frame = CGRect(x: bgView.frame.size.width - 2.5 - 23.0, y: 3.0, width: 23.0, height: 23.0)
                 button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                 button.layer.cornerRadius = CGFloat(button.frame.size.width)/CGFloat(2.0)
                 button.setImage(UIImage(named: "CrossWithoutCircle"), for: .normal)
                 button.tag = tag
                 button.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
                 bgView.addSubview(button)
                 xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
                 view.addSubview(bgView)
                 tag = tag  + 1
             }
     
         }
    //cancle button action
        @objc public func removeTag(_ sender: AnyObject) {
            searchResultArray.remove(at: (sender.tag - 1))
            print(searchResultArray)
            createTagCloud(OnView: searchChipsView, withArray: searchResultArray as [AnyObject])
        }
    
    @IBOutlet weak var topView: UIView!
    
    
    @IBAction func backButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var resultsTxtlabel: UILabel!
    
    

}

//extension for width and height
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
}

