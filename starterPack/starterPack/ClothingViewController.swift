//
//  ClothingViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class ClothingViewController: UIViewController {

    // TODO: change picker values based on country of origin
    // TODO: change converter based on database
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("clothing view did load")
        // Do any additional setup after loading the view.
        shoeSizePicker.dataSource = self
        shoeSizePicker.delegate = self
        
        pantsSizePicker.dataSource = self
        pantsSizePicker.delegate = self
        
        shirtSizePicker.dataSource = self
        shirtSizePicker.delegate = self
    }
    
    // establish variables
    @IBOutlet var shoeSizePicker: UIPickerView!
    let shoeSizes = [5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
    @IBOutlet var USShoe: UILabel!
    
    var shoeConversion = [5.5:7.5, 6:8, 6.5:8.5, 7:9, 7.5:9.5, 8:10, 8.5:10.5, 9:11, 9.5:11.5, 10:12]
    
    
    @IBOutlet var pantsSizePicker: UIPickerView!
    let pantSizes = [34, 36, 38, 40, 42, 44, 46, 48, 50]
    @IBOutlet var USpant: UILabel!
    var pantConversion = [34:2, 36:4, 38:6, 40:8, 42:10, 44:12, 46:14, 48:16, 50:18]
    
    @IBOutlet var shirtSizePicker: UIPickerView!
    let shirtSizes = ["small", "medium", "large", "xtra large", "2XL"]
    @IBOutlet var USShirt: UILabel!
    
    // this is just random nonsense, i promise its not a dig at americans being big ;)
    var shirtConversion = ["small":"xtra small", "medium":"small", "large":"medium", "xtra large":"large", "2XL": "xtra large"]
    
}


extension ClothingViewController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return 10
        }
        else if pickerView.tag == 2 {
            return 5
        }
        else if pickerView.tag == 3 {
            return 5
        }
        return 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            USShoe.text = String(shoeConversion[shoeSizes[row]]!)
        }
        else if pickerView.tag == 2 {
            USpant.text = String(pantConversion[pantSizes[row]]!)
        }
        else if pickerView.tag == 3 {
            USShirt.text = shirtConversion[shirtSizes[row]]!
        }
    }

}
extension ClothingViewController: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return String(shoeSizes[row])
        }
        else if pickerView.tag == 2 {
            return String(pantSizes[row])
        }
        else if pickerView.tag == 3 {
            return shirtSizes[row]
        }
        return "???"
    }
}
