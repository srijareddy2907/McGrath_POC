//
//  ViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 05/08/21.
//

import UIKit

class ViewController: UIViewController {

    //instantiations of ui elements
    @IBOutlet weak var ourView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userLoginLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldIcon(iconName: "Profile", textField: userNameTextField)
        TextFieldIcon(iconName: "PWHide", textField: passwordTextField)
      
    }
    
    func TextFieldIcon(iconName:String,textField:UITextField)
    {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
       //button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
    }
    
    @IBAction func hidePasswordIcon(_ sender: Any)
    {
        //to hide password and show password
    }
    
    @IBAction func onClickOfLoginButton(_ sender: Any)
    {
        //onclick of login button
        if userNameTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        {
        var TBVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "TBVC") as! UITabBarController
        TBVC.modalPresentationStyle = .fullScreen
        present(TBVC, animated: true, completion: nil)
        }
        else
        {
            alert = UIAlertController(title: "Warning", message: "Invalid Login", preferredStyle: UIAlertController.Style.alert)
            present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in

            }))

        }
        
    }
    
    @IBAction func onClickofSignInWithFBButton(_ sender: Any)
    {
        
    }
    
    @IBAction func onClickOfSignInWithGoogleButton(_ sender: Any)
    {
        
    }
    
    @IBAction func onClickOfCreatAccountButton(_ sender: Any)
    {
        
    }
    
    @IBAction func forgetPasswordButton(_ sender: Any)
    {
        
    }
    
    
    
    
    
    
    

}

