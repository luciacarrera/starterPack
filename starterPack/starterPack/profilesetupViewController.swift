//
//  profilesetupViewController.swift
//  starterPack
//
//  Created by Lucia Carrera Saenz on 11/10/21.
//

import UIKit

class profileSetupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var homeCountry: UITextField!
    @IBOutlet var timeZone: UITextField!
    @IBOutlet var currency: UITextField!
    @IBOutlet var languge: UITextField!
    @IBOutlet var clothing: UITextField!
    @IBOutlet var USTimeZone: UITextField!

    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var user: User!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        // "save" changes made to an item
        user.homeCountry = homeCountry.text ?? ""
        user.timeZone = timeZone.text ?? ""
        user.currency = currency.text ?? ""
        user.languge = languge.text ?? ""
        user.clothing = clothing.text ?? ""
        user.USTimeZone = USTimeZone.text ?? ""
        
        print(user.homeCountry)
        print(user.timeZone)
        print(user.currency)
        print(user.languge)
        print(user.clothing)
        print(user.USTimeZone)
    }
}
