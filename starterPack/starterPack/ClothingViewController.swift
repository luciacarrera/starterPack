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
        
        sizePicker.dataSource = self
        sizePicker.delegate = self
        
        generalPicker.dataSource = self
        generalPicker.delegate = self
    }
        
    // establish variables
    @IBOutlet var shoePicker: UIPickerView!
    @IBOutlet var USShoeLabel: UILabel!
    
    // corresponding lists ofo various shoe sizing systems
    var ukShoes = ["2.5", "3.5", "4", "5", "6", "6.5", "7", "7.5", "8"]
    var euShoes = ["35", "36", "37", "38", "39", "40", "41", "42", "43"]
    var jpnShoes = ["21", "22", "22.5", "23.5", "24.5", "25", "25.5", "26", "27"]
    var ausShoes = ["3.5", "4.5", "5", "6", "7", "7.5", "8", "8.5", "9"]
    var chinShoes = ["35.5", "37", "38", "39", "40", "41", "42", "43", "44"]

    
    @IBOutlet var sizePicker: UIPickerView!
    @IBOutlet var USSizeLabel: UILabel!
    
    // corresponding lists of various clothing sizing systems
    var ukSizes = ["4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26"]
    var euSizes = ["32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52", "54"]
    var jpnSizes = ["5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27"]
    var ausSizes = ["6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28"]
    var internSizes = ["xs", "xs", "s", "s", "m", "m", "l", "l", "xl", "xl", "xxl", "xxl"]
    
    var user: User!
    
    var homeCountryShoes = [String]()
    var homeCountrySizes = [String]()
    // assign home sizing system
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (user.homeCountry == "Canada") {
            homeCountryShoes = usShoes
            homeCountrySizes = usSizes
        }
        else if (user.homeCountry == "United Kingdom") {
            homeCountryShoes = ukShoes
            homeCountrySizes = ukSizes
        }
        else if (user.homeCountry == "Germany" || user.homeCountry == "France")  { // add any other EU countries
            homeCountryShoes = euShoes
            homeCountrySizes = euSizes
        }
        else if (user.homeCountry == "Japan") {
            homeCountryShoes = jpnShoes
            homeCountrySizes = jpnSizes
        }
        else if (user.homeCountry == "Australia") {
            homeCountryShoes = ausShoes
            homeCountrySizes = ausSizes
        }
        else  { // use international sizes
            homeCountryShoes = usShoes
            homeCountrySizes = internSizes

        }
        
    }
    
    // US sizing lists to compare to
    var usShoes = ["5", "6", "6.5", "7.5", "8.5", "9", "9.5", "10", "10.5"]
    var usSizes = ["2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24"]
    
    
    @IBOutlet var generalPicker: UIPickerView!
    @IBOutlet var USGeneralLabel: UILabel!
    var ukGeneral = ["S", "M", "L", "XL"]
    var generalSizeConversions = ["S":"XS", "M":"S", "L":"M", "XL":"L"]
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
            return ukGeneral.count
        }
        else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            USShoeLabel.text = String(usShoes[row])
        }
        else if pickerView.tag == 2 {
            USSizeLabel.text = String(usSizes[row])
        }
        else if pickerView.tag == 3 {
            USGeneralLabel.text = generalSizeConversions[ukGeneral[row]]
        }
    }
    
}
extension ClothingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return String(homeCountryShoes[row])
        }
        else if pickerView.tag == 2 {
            return String(homeCountrySizes[row])
        }
        else if pickerView.tag == 3 {
            return ukGeneral[row]
        }
        else {
            return "???"
        }
    }
}


