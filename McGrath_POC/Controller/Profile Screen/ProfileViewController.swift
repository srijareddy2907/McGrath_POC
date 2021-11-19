//
//  ProfileViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 10/08/21.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var profileChangeButton: UIButton!
    
    @IBOutlet weak var profilePicView: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["WishList","Orders","shoppingCart","Reviews"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        
        gradient.colors = [

          UIColor(red: 0.675, green: 0.714, blue: 0.898, alpha: 1).cgColor,

          UIColor(red: 0.525, green: 0.992, blue: 0.91, alpha: 1).cgColor

        ]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)

        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        profilePicView.layer.insertSublayer(gradient, at: 0)

        profileImage.layer.borderWidth = 5
        profileImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.layer.masksToBounds = true
        profileChangeButton.layer.cornerRadius = 5
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if items[indexPath.row] == "WishList"
        {
            var wishListVc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "WishListVC") as! WishListViewController
            wishListVc.modalPresentationStyle = .fullScreen
            present(wishListVc, animated: true, completion: nil)
            
        }
    }


}
