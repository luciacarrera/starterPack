//
//  CurrencyViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet var euroTextField: UITextField!
    @IBOutlet var dollarTextField: UITextField!
    var dollarValue: Measurement<Unit>? {
        didSet {
            updateEuroText()
        }
    }
    var euroValue: Decimal? {
        didSet {
            updateDollarText()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDollarText()
        updateEuroText()
    }
    
    @IBAction func dollarFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            dollarTextField.text = String(value * 1.164)
        } else {
            dollarValue = nil
        }
    }
    
    @IBAction func euroFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text){
            euroTextField.text = String(value * 0.859)
        } else {
            euroTextField.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        dollarTextField.resignFirstResponder()
        euroTextField.resignFirstResponder()
    }
    
    func updateEuroText() {
        if let euroValue = euroValue {
            euroTextField.text = "\(euroValue)"
        } else {
            euroTextField.text = "???"
        }
    }
    
    func updateDollarText() {
        if let dollarValue = dollarValue {
            dollarTextField.text = "\(dollarValue)"
        } else {
            dollarTextField.text = "???"
        }
    }
    
//    let numberFormatter: NumberFormatter = {
//        let nf = NumberFormatter()
//        nf.numberStyle = .decimal
//        nf.minimumFractionDigits = 0
//        nf.maximumFractionDigits = 1
//        return nf
//    }

}
