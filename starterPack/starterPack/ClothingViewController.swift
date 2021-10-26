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
    
    @IBOutlet var pantPicker: UIPickerView!
    @IBOutlet var USPantSize: UILabel!

    @IBOutlet var shirtPicker: UIPickerView!
    @IBOutlet var USShirtSize: UILabel!
    
  
}

extension ClothingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return 8
        }
        else if pickerView.tag == 2 {
            return 6
        }
        else if pickerView.tag == 3 {
            return 4
        }
        else {
            return 0
        }
    }
}
extension ClothingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "test"
    }
}


