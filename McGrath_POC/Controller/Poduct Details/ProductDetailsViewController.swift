//
//  ProductDetailsViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 06/08/21.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var sizesShowingView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var productDetailsView: UIView!
    
    @IBOutlet weak var reviewsView: UIView!
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var modulatOfficeTextLabel: UILabel!
    @IBOutlet weak var sizesTextLabel: UILabel!
    @IBOutlet weak var availableSizeslabel: UILabel!
    @IBOutlet weak var aboutSizesLabel: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    @IBOutlet weak var productSizelabel: UILabel!
    @IBOutlet weak var modelNumLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var featuresTxtLabel: UILabel!
    @IBOutlet weak var featuresShowingLabel: UILabel!
    @IBOutlet weak var aboutModularOfficeTxtView: UITextView!
    
    @IBOutlet weak var imageViewObj: UIImageView!
    
    @IBOutlet weak var seeInventoryButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var whatsAppView: UIView!
    @IBOutlet weak var whatsAppImage: UIImageView!
    
    @IBOutlet weak var faceBookView: UIView!
    @IBOutlet weak var faceBookImage: UIImageView!
    
    @IBOutlet weak var twitterView: UIView!
    @IBOutlet weak var twitterImage: UIImageView!
    
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var transpImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shareView.isHidden = true
        transpImage.isHidden = true
        segmentControl.addUnderlineForSelectedSegment()
        segmentControl.selectedSegmentIndex = 0
        segmentControl.sendActions(for: UIControl.Event.valueChanged)
        
        whatsAppView.layer.borderWidth = 1
        whatsAppView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        whatsAppView.layer.cornerRadius = 10
        
        faceBookView.layer.borderWidth = 1
        faceBookView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        faceBookView.layer.cornerRadius = 10
        
        twitterView.layer.borderWidth = 1
        twitterView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        faceBookView.layer.cornerRadius = 10
        
        addToCartButton.layer.cornerRadius = 5
        reviewsView.isHidden = true
        blueView.isHidden = false
        sizesShowingView.isHidden = false
        productDetailsView.isHidden = false
        aboutModularOfficeTxtView.isHidden = false
        modulatOfficeTextLabel.isHidden = false
        
       }

    @IBAction func segmentControl(_ sender: Any)
    {
        segmentControl.changeUnderlinePosition()
        
        if segmentControl.selectedSegmentIndex == 0
        {
            reviewsView.isHidden = true
            blueView.isHidden = false
            sizesShowingView.isHidden = false
            productDetailsView.isHidden = false
            aboutModularOfficeTxtView.isHidden = false
            modulatOfficeTextLabel.isHidden = false
        }
        else if segmentControl.selectedSegmentIndex == 3
        {
            reviewsView.isHidden = false
            reviewsView.backgroundColor = .red
            sizesShowingView.isHidden = true
            blueView.isHidden = true
            shareView.isHidden = true
            productDetailsView.isHidden = true
            aboutModularOfficeTxtView.isHidden = true
            modulatOfficeTextLabel.isHidden = true
            
            
        }
        
    }
    
    @IBAction func seeInventoryButton(_ sender: Any)
    {
        
    }
    @IBAction func backButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func callNowButton(_ sender: Any)
    {
        
    }
    
    @IBAction func searchButton(_ sender: Any)
    {
        
    }
    
    @IBAction func getQuoteButton(_ sender: Any)
    {

    }
    
    @IBAction func addToCartButton(_ sender: Any)
    {
        
    }
    
    
    @IBAction func VideoButton(_ sender: Any)
    {
        var Video360 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "Video360") as! Video360ViewController
        Video360.modalPresentationStyle = .fullScreen
        present(Video360, animated: true, completion: nil)
    }
    
    

    
    @IBAction func shareButton(_ sender: Any)
    {
        shareView.isHidden = false
        shareView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        shareView.layer.cornerRadius = 30
        transpImage.isHidden = false

        scrollView.isScrollEnabled = false
    }
    
    
    @IBAction func whatsAppButton(_ sender: Any) {
    }
    
  
    @IBAction func faceBookButton(_ sender: Any) {
    }
    
    @IBAction func twitterButton(_ sender: Any) {
    }
    
    
   
    @IBAction func dragDownGesture(_ sender: Any)
    {
        
    }
    
    
    @IBAction func dragDown(_ sender: Any)
    {
        shareView.isHidden = true
        transpImage.isHidden = true
        scrollView.isScrollEnabled = true
    }
    
    
    

}

extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)], for: .selected)
    }

    
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 5.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 3.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}
