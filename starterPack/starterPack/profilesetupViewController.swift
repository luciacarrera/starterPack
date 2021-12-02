//
//  profilesetupViewController.swift
//  starterPack
//
//  Created by Lucia Carrera Saenz on 11/10/21.
//

import UIKit

class profileSetupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var homeCountryField: UITextField!
    @IBOutlet var timeZoneField: UITextField!
    @IBOutlet var languageField: UITextField!
    @IBOutlet var currencyField: UITextField!
    @IBOutlet var clothingField: UITextField!
    @IBOutlet var americanTimeZoneField: UITextField!

    
    @IBAction func done(_ sender: UIButton) {
        // check data
        if homeCountryField.text == "" || timeZoneField.text == "" || currencyField.text == "" || languageField.text == "" || clothingField.text == "" || americanTimeZoneField.text == "" {
            // if incomplete data, pop alert
            let alertcontroller = UIAlertController(title: "Incomplete Data", message: "please fill out all fields", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertcontroller.addAction(okAction)
            present(alertcontroller, animated: true, completion: nil)
        }
        // else, run segue
        else {
            // dont do anything
        }
    }

    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        homeCountryField.text = user.homeCountry
        timeZoneField.text = user.timeZone
        currencyField.text = user.currency
        languageField.text = user.language
        clothingField.text = user.clothing
        americanTimeZoneField.text = user.americanTimeZone
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        // "save" changes made to an item
        user.homeCountry = homeCountryField.text ?? ""
        user.timeZone = timeZoneField.text ?? ""
        user.currency = currencyField.text ?? ""
        user.language = languageField.text ?? ""
        user.clothing = clothingField.text ?? ""
        user.americanTimeZone = americanTimeZoneField.text ?? ""
        
        print(user.homeCountry)
        print(user.timeZone)
        print(user.currency)
        print(user.language)
        print(user.clothing)
        print(user.americanTimeZone)
    }
    
}
