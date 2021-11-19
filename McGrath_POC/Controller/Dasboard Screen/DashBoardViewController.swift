//
//  DashBoardViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 05/08/21.
//

import UIKit
import WebKit
import CoreLocation
import UserNotifications

class DashBoardViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pageCollectionView: UICollectionView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var todayDealsLabel: UILabel!
    
    var imageArray:[String] = ["image","image","image","image","image"]
    var products:[String] = ["product1","product2","product3","product4"]
    var productName:[String] = ["Modular office","modular classroom","",""]
    var size:[String] = ["10'*40'","18'*24","10'*40","10'*40"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageCollectionView.register(UINib(nibName: "PageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PageCollectionViewCell")
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        
        itemsCollectionView.register(UINib(nibName: "DealItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DealItemsCollectionViewCell")
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == pageCollectionView
        {
            return imageArray.count
        }
        else if collectionView == itemsCollectionView
        {
            return 4
        }
        else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pageCollectionView
        {
            let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as! PageCollectionViewCell
            
            cell.imageViewObj.image = UIImage(named: imageArray[indexPath.row])
            return cell
        }
        else /*if collectionView == itemsCollectionView*/
        {
            let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: "DealItemsCollectionViewCell", for: indexPath) as! DealItemsCollectionViewCell
            cell.layer.cornerRadius = 15
            cell.imagesView.image = UIImage(named: products[indexPath.row])
            cell.nameLabel.text = productName[indexPath.row]
            cell.sizeLabel.text = size[indexPath.row]
            
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pageCollectionView
        {
            return CGSize(width: 374, height: 200)
        }
        else {
            return CGSize(width: 180, height: 290)
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        var ProductDetailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ProductDetailsVC") as! ProductDetailsViewController
        ProductDetailsVC.modalPresentationStyle = .fullScreen
        present(ProductDetailsVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func searchFiltersButton(_ sender: Any)
    {
        var searchVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SearchVC") as! SearchViewController
        searchVC.modalPresentationStyle = .fullScreen
        present(searchVC, animated: true, completion: nil)
    }
    
    @IBAction func categoriesButton(_ sender: Any)
    {
    }
    
    @IBAction func couponsButton(_ sender: Any)
    {
    }
    
    @IBAction func saleButton(_ sender: Any)
    {
    }
    
    @IBAction func flashDealsButton(_ sender: Any)
    {
    }
    
    
}
