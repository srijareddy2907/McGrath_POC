//
//  WishListViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 10/08/21.
//

import UIKit

class WishListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var wishlistTxtLabel: UILabel!
    @IBOutlet weak var wislistCollectionView: UICollectionView!
    
//    var imageArray:[String] = ["image","image","image","image","image"]
    var items:[String] = ["product1","product2","product3","product4","product4","product4"]
    var itemName:[String] = ["Modular office","modular classroom","modular Office","Modular Office","Modular Office","Modular Office"]
    var itemSize:[String] = ["10'*40'","18'*24","10'*40","10'*40","10'*40","10'*40"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wislistCollectionView.register(UINib(nibName: "DealItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DealItemsCollectionViewCell")
        wislistCollectionView.delegate = self
        wislistCollectionView.dataSource = self
        wislistCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = wislistCollectionView.dequeueReusableCell(withReuseIdentifier: "DealItemsCollectionViewCell", for: indexPath) as! DealItemsCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.imagesView.image = UIImage(named: items[indexPath.row])
        cell.nameLabel.text = itemName[indexPath.row]
        cell.sizeLabel.text = itemSize[indexPath.row]
        cell.likeButton.setImage(UIImage(named: "Heart"), for: UIControl.State.normal)
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: 180, height: 290)

    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        var ProductDetailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ProductDetailsVC") as! ProductDetailsViewController
        ProductDetailsVC.modalPresentationStyle = .fullScreen
        present(ProductDetailsVC, animated: true, completion: nil)
    }

    @IBAction func BackButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }

    
    
    
}
