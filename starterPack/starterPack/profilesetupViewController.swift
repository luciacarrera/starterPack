//
//  profilesetupViewController.swift
//  starterPack
//
//  Created by Lucia Carrera Saenz on 11/10/21.
//

import UIKit

class profileSetupViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        homeContryPicker.dataSource = self
        homeContryPicker.delegate = self
        
        timeZonePicker.dataSource = self
        timeZonePicker.delegate = self
        
        langugePicker.dataSource = self
        langugePicker.delegate = self
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        clothingPicker.dataSource = self
        clothingPicker.delegate = self
        
        americanTimeZonePicker.dataSource = self
        americanTimeZonePicker.delegate = self
    }
    
    
    @IBOutlet var homeContryPicker: UIPickerView!
    var homeCountryOptions = ["USA", "Spain", "France", "Canada"]
    
    @IBOutlet var timeZonePicker: UIPickerView!
    var timeZoneOptions = ["PST", "MST", "CST", "EST", "other time zone"]
    
    @IBOutlet var langugePicker: UIPickerView!
    var langugeOptions = ["English", "Spanish", "French", "Mandarin"]
    
    @IBOutlet var currencyPicker: UIPickerView!
    var currencyOptions = ["USD", "Euro", "Yen"]
    
    @IBOutlet var clothingPicker: UIPickerView!
    var clothingOptions = ["US sizing", "Euro sizing", "??"]

    @IBOutlet var americanTimeZonePicker: UIPickerView!
    var americanTimeZoneOptions = ["PST", "MST", "CST", "EST"]


    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var user: User!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
        homeCountryField.text = user.homeCountry
        //timeZoneField.text = user.timeZone
        currencyField.text = user.currency
        languageField.text = user.language
        clothingField.text = user.clothing
        americanTimeZoneField.text = user.americanTimeZone
         */
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        /*
        // "save" changes made to an item
        user.homeCountry = homeCountryField.text ?? ""
        //user.timeZone = timeZoneField.text ?? ""
        user.currency = currencyField.text ?? ""
        user.language = languageField.text ?? ""
        user.clothing = clothingField.text ?? ""
        user.americanTimeZone = americanTimeZoneField.text ?? ""
        */
         
        print(user.homeCountry)
        print(user.timeZone)
        print(user.currency)
        print(user.language)
        print(user.clothing)
        print(user.americanTimeZone)
    }
    
}

extension profileSetupViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return homeCountryOptions.count
        }
        else if pickerView.tag == 2 {
            return timeZoneOptions.count
        }
        else if pickerView.tag == 3 {
            return langugeOptions.count
        }
        else if pickerView.tag == 4 {
            return currencyOptions.count
        }
        else if pickerView.tag == 5 {
            return clothingOptions.count
        }
        else if pickerView.tag == 6 {
            return americanTimeZoneOptions.count
        }
        else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            user.homeCountry = homeCountryOptions[row]
        }
        else if pickerView.tag == 2 {
            user.timeZone = timeZoneOptions[row]
        }
        else if pickerView.tag == 3 {
            user.language = langugeOptions[row]
        }
        else if pickerView.tag == 4 {
            user.currency = currencyOptions[row]
        }
        else if pickerView.tag == 5 {
            user.clothing = clothingOptions[row]
        }
        else if pickerView.tag == 6 {
            user.americanTimeZone = americanTimeZoneOptions[row]
        }
    }
}
extension profileSetupViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        if pickerView.tag == 1 {
            return homeCountryOptions[row]
        }
        else if pickerView.tag == 2 {
            return timeZoneOptions[row]
        }
        else if pickerView.tag == 3 {
            return langugeOptions[row]
        }
        else if pickerView.tag == 4 {
            return currencyOptions[row]
        }
        else if pickerView.tag == 5 {
            return clothingOptions[row]
        }
        else if pickerView.tag == 6 {
            return americanTimeZoneOptions[row]
        }
        else {
            return "???"
        }
    }
}
