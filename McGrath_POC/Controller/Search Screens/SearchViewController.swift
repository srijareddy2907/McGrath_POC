//
//  SearchViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 05/08/21.
//

import UIKit
import DropDown

class SearchViewController: UIViewController{

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var produvtTypeLabel: UILabel!
    @IBOutlet weak var productTypeTextField: UITextField!
    @IBOutlet weak var searchFilterLabel: UILabel!
    @IBOutlet weak var sizelabel: UILabel!
    @IBOutlet weak var minSizeTextField: UITextField!
    @IBOutlet weak var maxSizeTextField: UITextField!
    @IBOutlet weak var furnishedLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var eitherLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var HCDLabel: UILabel!
    @IBOutlet weak var HCDYesLabel: UILabel!
    @IBOutlet weak var HCDNoLabel: UILabel!
    @IBOutlet weak var minWidthTextField: UITextField!
    @IBOutlet weak var maxWidthTextField: UITextField!
    @IBOutlet weak var minHeightTextField: UITextField!
    @IBOutlet weak var maxHeightTextField: UITextField!
    @IBOutlet weak var modelNumberTextField: UITextField!
    @IBOutlet weak var furnishedYesButton: UIButton!
    @IBOutlet weak var furnishedNoButton: UIButton!
    @IBOutlet weak var eitherButton: UIButton!
    @IBOutlet weak var HCDYesButton: UIButton!
    @IBOutlet weak var HCDNoButton: UIButton!
    
    @IBOutlet weak var minWidthDropDown: UIView!
    @IBAction func minWidthButton(_ sender: Any)
    {
        minimumWidthDropDown.show()
    }
    
    @IBOutlet weak var productDropDown: UIView!
    @IBAction func productButton(_ sender: Any)
    {
        productTypeDropDown.show()
    }
    
    @IBOutlet weak var maxWidthDropDown: UIView!
    @IBAction func maxWidthButton(_ sender: Any)
    {
        maximumWidthDropDown.show()
    }
    
    @IBOutlet weak var minHeightDropDown: UIView!
    @IBAction func minHeightButton(_ sender: Any) {
        minimumHeightDropDown.show()
    }
    
    @IBOutlet weak var maxHeightDropDown: UIView!
    @IBAction func maxHeightButton(_ sender: Any) {
        maximumHeightDropDown.show()
    }
    
    //drop down initializations
    let LocationdropDown = DropDown()
    let minimumWidthDropDown = DropDown()
    let maximumWidthDropDown = DropDown()
    let productTypeDropDown = DropDown()
    let minimumHeightDropDown = DropDown()
    let maximumHeightDropDown = DropDown()
    
    let locationList = ["Arizona","california","canada","Florida","georgia","Minneapolis","New Jesey","Texas","Virginia"]
    let MinWidthList = ["2000","3000","4000","5000","6000"]
    let maxWidthList = ["20000","30000","40000","50000","60000"]
    let MinHeightList = ["2500","3500","4500","5500","6500"]
    let maxHeightList = ["25000","35000","45000","55000","65000"]
    let productTypeList = ["Offices","Classrooms","Storage","HealthCare","Retails","Kitchens"]
    var searchFiltersArray:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //button for textfields
        TextFieldIcon(iconName: "filter", textField: searchTextField)
        TextFieldIcon(iconName: "ArrowDown", textField: productTypeTextField)
        TextFieldIcon(iconName: "ArrowDown", textField: minWidthTextField)
        TextFieldIcon(iconName: "ArrowDown", textField: maxWidthTextField)
        TextFieldIcon(iconName: "ArrowDown", textField: minHeightTextField)
        TextFieldIcon(iconName: "ArrowDown", textField: maxHeightTextField)
        //dropdowns for textfields
        dropdown(textField: searchTextField, list: locationList, text: "select location", dropdownView: dropDownView, dropdown: LocationdropDown)
        dropdown(textField: minWidthTextField, list: MinWidthList, text: "Min", dropdownView: minWidthDropDown, dropdown: minimumWidthDropDown)
        dropdown(textField: productTypeTextField, list: productTypeList, text: "select Product Type", dropdownView: productDropDown, dropdown: productTypeDropDown)
        dropdown(textField: maxWidthTextField, list: maxWidthList, text: "Max", dropdownView: maxWidthDropDown, dropdown: maximumWidthDropDown)
        dropdown(textField: minHeightTextField, list: MinHeightList, text: "Min", dropdownView: minHeightDropDown, dropdown: minimumHeightDropDown)
        dropdown(textField: maxHeightTextField, list: maxHeightList, text: "Max", dropdownView: maxHeightDropDown, dropdown: maximumHeightDropDown)
        
    }
    //this function is for creating the button in textfield
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
    
    //dropdown textfield
    func dropdown(textField:UITextField, list:Array<String>,text:String,dropdownView:UIView,dropdown:DropDown)
    {
        textField.text = text
        dropdown.anchorView = dropdownView
        dropdown.dataSource = list
        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.direction = .bottom
        dropdown.dismissMode = .onTap
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            textField.text = "\(list[index])"

        }
    }
    
    @IBAction func dropDownButton(_ sender: Any)
    {
        LocationdropDown.show()
    }
    
    //check button tapped function for select/deselect
    func myButtonTapped(button:UIButton){
      if button.isSelected == true {
        button.isSelected = false
        button.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
      }else {
        button.isSelected = true
        button.setImage(UIImage(named: "filled checkround"), for: UIControl.State.normal)
      }
    }
    
    @IBAction func furnishedYesButton(_ sender: Any)
    {
        myButtonTapped(button: furnishedYesButton)
        if furnishedYesButton.isSelected
        {
            furnishedNoButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
            eitherButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
        }
    }
    
    //select/deselect button actions
    @IBAction func furnishedNoButton(_ sender: Any)
    {
        myButtonTapped(button: furnishedNoButton)
        if furnishedNoButton.isSelected
        {
            furnishedYesButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
            eitherButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func eitherButton(_ sender: Any)
    {
        myButtonTapped(button: eitherButton)
        if eitherButton.isSelected
        {
            furnishedNoButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
            furnishedYesButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func HCDYesButton(_ sender: Any)
    {
        myButtonTapped(button: HCDYesButton)
        if HCDYesButton.isSelected
        {
            HCDNoButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func HCDNoButton(_ sender: Any)
    {
        myButtonTapped(button: HCDNoButton)
        if HCDNoButton.isSelected
        {
            HCDYesButton.setImage(UIImage(named: "checkround"), for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func searchButton(_ sender: Any)
    {
        performSegue(withIdentifier: "SearchResults", sender: nil)//performing segue operation to navigate to search result view controller
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        searchFiltersArray.removeAll()
        //appendings all the filter results into an array
        if searchTextField.text?.isEmpty == false
        {
            searchFiltersArray.append(searchTextField.text!)
        }
        if productTypeTextField.text?.isEmpty == false
        {
            searchFiltersArray.append(productTypeTextField.text!)
        }
        if minSizeTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Min Size-\(minSizeTextField.text!)")
        }
        if maxSizeTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Max Size-\(maxSizeTextField.text!)")
        }
        if minWidthTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Min Width-\(minWidthTextField.text!)")
        }
        if maxWidthTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Max width-\(maxWidthTextField.text!)")
        }
        if minHeightTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Max Height-\(minHeightTextField.text!)")
        }
        if maxHeightTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Max Height-\(maxHeightTextField.text!)")
        }
        if modelNumberTextField.text?.isEmpty == false
        {
            searchFiltersArray.append("Model-\(modelNumberTextField.text!)")
        }
        if HCDYesButton.isSelected == true
        {
            searchFiltersArray.append("HCD Approved-YES")
        }
        if furnishedYesButton.isSelected == true
        {
            searchFiltersArray.append("Furnished-YES")
        }
        else if furnishedNoButton.isSelected == true
        {
            searchFiltersArray.append("Furnished-NO")
        }
        else if eitherButton.isSelected == true
        {
            searchFiltersArray.append("Furnished-Either")
        }
        
        print("search View controller - \(searchFiltersArray)")
        
            let searchResult = segue.destination as? SearchResultsViewController
            searchResult?.modalPresentationStyle = .fullScreen
        searchResult?.searchResultArray = searchFiltersArray
            
    }
    
    @IBAction func backArrowButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
