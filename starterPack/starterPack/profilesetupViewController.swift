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
    var homeCountryOptions = ["China", "India", "Indonesia", "Pakistan", "Brazil", "Nigeria", "Bangladesh", "Russia", "Mexico", "Japan", "Ethiopia", "Phillipines", "Egypt", "Vietnam", "Iran", "Turkey", "Germany", "Spain", "France", "United Kingdom", "Canada", "South Africa", "Italy", "South Korea", "Australia"]
    
    @IBOutlet var timeZonePicker: UIPickerView!
    var timeZoneOptions = ["AKDT", "HST", "PST", "MST", "CST", "EST", "EGT", "CET", "IST", "MSK", "WET", "GET", "HKT", "IRDT", "JST", "MMT", "NPT", "PHT", "KST", "CAT", "WAST", "AST"]
    
    @IBOutlet var langugePicker: UIPickerView!
    var langugeOptions = ["Arabic", "Bengali", "Bosnian", "Bulgarian", "Chinese (Simplified)", "Chinese (Traditional)", "Croatian", "Czech", "Danish", "Dutch", "English", "Estonian", "Finnish", "French", "German", "Greek", "Gujarati", "Hebrew", "Hindi", "Hungarian", "Irish", "Indonesian", "Italian", "Japanese", "Korean", "Latvian", "Lithuanian", "Malay", "Malayalam", "Maltese", "Nepali", "Norwegian Bokmål", "Polish", "Portuguese", "Romanian", "Russian", "Sinhala", "Slovak", "Slovenian", "Spanish", "Swedish", "Tamil", "Telugu", "Thai", "Turkish", "Ukrainian", "Urdu", "Vietnamese", "Welsh"]
    
    @IBOutlet var currencyPicker: UIPickerView!
    var currencyOptions = ["USD", "Euro", "Yen"]
    
    @IBOutlet var clothingPicker: UIPickerView!
    var clothingOptions = ["US sizing", "Euro sizing"]

    @IBOutlet var americanTimeZonePicker: UIPickerView!
    var americanTimeZoneOptions = ["AKDT", "HST", "PST", "MST", "CST", "EST"]


    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let homeCountryIndex = homeCountryOptions.firstIndex(of: user.homeCountry){
            homeContryPicker.selectRow(homeCountryIndex, inComponent: 0, animated: true)
        }
        if let timeZoneIndex = timeZoneOptions.firstIndex(of: user.timeZone){
            timeZonePicker.selectRow(timeZoneIndex, inComponent: 0, animated: true)
        }
        if let langugeIndex = langugeOptions.firstIndex(of: user.language){
            langugePicker.selectRow(langugeIndex, inComponent: 0, animated: true)
        }
        if let currencyIndex = currencyOptions.firstIndex(of: user.currency){
            currencyPicker.selectRow(currencyIndex, inComponent: 0, animated: true)
        }
        if let clothingIndex = clothingOptions.firstIndex(of: user.clothing){
            clothingPicker.selectRow(clothingIndex, inComponent: 0, animated: true)
        }
        if let americanTimeZoneIndex = americanTimeZoneOptions.firstIndex(of: user.americanTimeZone){
            americanTimeZonePicker.selectRow(americanTimeZoneIndex, inComponent: 0, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)

        print(user.homeCountry)
        print(user.timeZone)
        print(user.language)
        print(user.currency)
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
