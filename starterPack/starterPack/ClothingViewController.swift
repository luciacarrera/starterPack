//
//  ClothingViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class ClothingViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        shoePicker.dataSource = self
        shoePicker.delegate = self
        
        pantPicker.dataSource = self
        pantPicker.delegate = self
        
        shirtPicker.dataSource = self
        shirtPicker.delegate = self
    }
        
    // establish variables
    @IBOutlet var shoePicker: UIPickerView!
    @IBOutlet var USShoeSize: UILabel!
    var ukShoes = [4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
    var shoeSizeConversions = [4:6, 4.5:6.5, 5:7, 5.5:7.5, 6:8, 6.5:8.5, 7:9, 7.5:9.5, 8:10, 8.5:10.5, 9:11, 9.5:11.5, 10:12]
    
    
    @IBOutlet var pantPicker: UIPickerView!
    @IBOutlet var USPantSize: UILabel!
    
    // corresponding lists of various sizing systems
    var ukSizes = ["4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26"]
    var euSizes = ["32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52", "54"]
    var jpnSizes = ["5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27"]
    var ausSizes = ["6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28"]
    var internSizes = ["xs", "xs", "s", "s", "m", "m", "l", "l", "xl", "xl", "xxl", "xxl"]
    
    var user: User!
    
    var homeCountrySizes = [String]()
    // assign home sizing system
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (user.homeCountry == "Canada") {
            homeCountrySizes = usSizes
        }
        else if (user.homeCountry == "United Kingdom") {
            homeCountrySizes = ukSizes
        }
        else if (user.homeCountry == "Germany" || user.homeCountry == "France")  { // add any other EU countries
            homeCountrySizes = euSizes
        }
        else if (user.homeCountry == "Japan") {
            homeCountrySizes = jpnSizes
        }
        else if (user.homeCountry == "Australia") {
            homeCountrySizes = ausSizes
        }
        else  { // use international sizes
            homeCountrySizes = internSizes
        }
    }
    
    
    /*
    if (user.homeCountry == "Canada") {
        homeCountrySizes = usSizes
    }
    else if (user.homeCountry == "United Kingdom") {
        homeCountrySizes = ukSizes
    }
    else if (user.homeCountry == "Germany" || user.homeCountry == "France")  { // add any other EU countries
        homeCountrySizes = euSizes
    }
    else if (user.homeCountry == "Japan") {
        homeCountrySizes = jpnSizes
    }
    else if (user.homeCountry == "Australia") {
        homeCountrySizes = ausSizes
    }
    else  { // use international sizes
        homeCountrySizes = internSizes
    }
     */
    
    // US sizing list to compare to
    var usSizes = ["2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24"]
    
    
    @IBOutlet var shirtPicker: UIPickerView!
    @IBOutlet var USShirtSize: UILabel!
    var ukShirts = ["S", "M", "L", "XL"]
    var shirtSizeConversions = ["S":"XS", "M":"S", "L":"M", "XL":"L"]
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
            return usSizes.count
        }
        else if pickerView.tag == 3 {
            return ukShirts.count
        }
        else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            USShoeSize.text = String(shoeSizeConversions[ukShoes[row]]!)
        }
        else if pickerView.tag == 2 {
            USPantSize.text = String(usSizes[row])
        }
        else if pickerView.tag == 3 {
            USShirtSize.text = shirtSizeConversions[ukShirts[row]]
        }
    }
    
}
extension ClothingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return String(ukShoes[row])
        }
        else if pickerView.tag == 2 {
            return String(homeCountrySizes[row])
        }
        else if pickerView.tag == 3 {
            return ukShirts[row]
        }
        else {
            return "???"
        }
    }
}


