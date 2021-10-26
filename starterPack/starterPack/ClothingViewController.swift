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

        shoePicker.dataSource = self
        shoePicker.delegate = self
        
        pantPicker.dataSource = self
        pantPicker.delegate = self
        
        shirtPicker.dataSource = self
        shirtPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // establish variables
    @IBOutlet var shoePicker: UIPickerView!
    @IBOutlet var USShoeSize: UILabel!
    var ukShoes = [4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
    var shoeSizeConversions = [4:6, 4.5:6.5, 5:7, 5.5:7.5, 6:8, 6.5:8.5, 7:9, 7.5:9.5, 8:10, 8.5:10.5, 9:11, 9.5:11.5, 10:12]
    
    
    @IBOutlet var pantPicker: UIPickerView!
    @IBOutlet var USPantSize: UILabel!
    var ukPants = [32, 34, 36, 38, 40, 42, 44, 46, 48]
    var pantSizeConversions = [32:4, 34:6, 36:8, 38:10, 40:12, 42:14, 44:16, 46:18, 48:20]
    
    @IBOutlet var shirtPicker: UIPickerView!
    @IBOutlet var USShirtSize: UILabel!
    var ukShirts = ["small", "medium", "large", "xtra large"]
    var shirtSizeConversions = ["small":"xtra small", "medium":"small", "large":"medium", "xtra large":"large"]
    
  
}

extension ClothingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return ukShoes.count
        }
        else if pickerView.tag == 2 {
            return ukPants.count
        }
        else if pickerView.tag == 3 {
            return ukShirts.count
        }
        else {
            return 0
        }
    }
    
}
extension ClothingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return String(ukShoes[row])
        }
        else if pickerView.tag == 2 {
            return String(ukPants[row])
        }
        else if pickerView.tag == 3 {
            return ukShirts[row]
        }
        else {
            return "???"
        }
    }
}


