//
//  TemperatureViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class TemperatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Conversion Controller did load")
        updateCelsiusLabel()
    }
    
    var user: User!
    
    //initialize label and buttons
    @IBOutlet var fahrenheitField: UITextField!
    @IBOutlet var celsiusField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        didSet {
            updateFahrenheitLabel()
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let celsiusValue = fahrenheitValue?.converted(to: .celsius) {
            celsiusField.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusField.text = "???"
        }
    }
    
    func updateFahrenheitLabel() {
        if let fahrenheitValue = celsiusValue?.converted(to: .fahrenheit) {
            fahrenheitField.text = numberFormatter.string(from: NSNumber(value: fahrenheitValue.value))
        } else {
            fahrenheitField.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ fahrenheitField: UITextField) {
        if let text = fahrenheitField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func celsiusFieldEditingChanged(_ celsiusField: UITextField) {
        if let text = celsiusField.text, let value = Double(text) {
            celsiusValue = Measurement(value: value, unit: .celsius)
        } else {
            celsiusValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitField.resignFirstResponder()
        celsiusField.resignFirstResponder()

    }
}
