//
//  ClothingViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class ClothingViewController: UIViewController {

    
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
    
    
    
    @IBOutlet var pantsSizePicker: UIPickerView!
    let pantSizes = [26, 28, 30, 32, 34]
    @IBOutlet var USpant: UILabel!
    
    
    @IBOutlet var shirtSizePicker: UIPickerView!
    let shirtSizes = ["small", "medium", "large", "xtra large"]
    @IBOutlet var USShirt: UILabel!
    
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
            return 4
        }
        return 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            USShoe.text = String(shoeSizes[row])
        }
        else if pickerView.tag == 2 {
            USpant.text = String(pantSizes[row])
        }
        else if pickerView.tag == 3 {
            USShirt.text = shirtSizes[row]
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
