//
//  CurrencyViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class CurrencyViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var euroTextField: UITextField!
    @IBOutlet var dollarTextField: UITextField!
    var dollarValue: Measurement<Unit>? {
        didSet {
            updateEuroText()
        }
    }
    var euroValue: Measurement<Unit>? {
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
            dollarTextField.text = numberFormatter.string(from: NSNumber(value: value * 1.164))
        } else {
            dollarTextField.text = ""
        }
    }
    
    @IBAction func euroFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text){
            euroTextField.text = numberFormatter.string(from: NSNumber(value: value * 0.859))
        } else {
            euroTextField.text = ""
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
            euroTextField.text = ""
        }
    }
    
    func updateDollarText() {
        if let dollarValue = dollarValue {
            dollarTextField.text = "\(dollarValue)"
        } else {
            dollarTextField.text = ""
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }

}
