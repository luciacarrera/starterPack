//
//  MeasurementViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class MeasurementViewController: UIViewController {
    
    @IBOutlet var fromField: UITextField!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var toField: UITextField!
    @IBOutlet var toLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let conversion_keys: [String:String] = ["length": "ft"]
    let conversions = ["length": [["ft":1.0, "meter":0.3048, "centimeter":0.0328084, "mile":0.000189394, "inch":12, "yard":0.3333]]]
    
    var conv_type = "length"

    var toValue : Double = 0.0 {
        didSet {
            updateFromField()
        }
    }
    
    var fromValue : Double = 0.0 {
        didSet {
            updateToField()
        }
    }

    var from_type = "ft"
    var to_type = "meter"
    
    func convert (_ val : Double, _ from_type : String, _ to_type : String, _ conv_type : String) -> Double{
        let conversion_keys: [String:String] = ["length": "ft"]
        let conversions = ["length": [["ft":1.0, "meter":0.3048, "centimeter":0.0328084, "mile":0.000189394, "inch":12, "yard":0.3333]]]
        
        
        let conv_base = conversions[conv_type]![0][conversion_keys[conv_type]!]!
        let conv_from = conversions[conv_type]![0][from_type]!
        let conv_to = conversions[conv_type]![0][to_type]!
        let conv_val = val * (conv_from / conv_base) / conv_to
        
        return conv_val
    }
    
    func updateToField() {
        if let x =  Double(fromField.text!) {
            toField.text = String(convert(x, from_type, to_type, conv_type)) //= convert(x, from_type, to_type, conv_type)
        } else {
            toField.text = "???"
        }
    }
    
    func updateFromField() {
        print("from updated")
        if let x =  Double(toField.text!) {
            fromField.text = String(convert(x, from_type, to_type, conv_type))
        } else {
            fromField.text = "???"
        }
    }
    
    @IBAction func fromFieldEditingChanged(_ fromField: UITextField) {
        print("from changed")
        if let text = fromField.text, let value = Double(text) {
            fromValue = convert(value, to_type, from_type, conv_type)
        } else {
            fromValue = 0
        }
    }
    
    @IBAction func toFieldEditingChanged(_ celsiusField: UITextField) {
        print("to changed")
        if let text = toField.text, let value = Double(text) {
            toValue = convert(value, from_type, to_type, conv_type)
        } else {
            toValue = 0
        }
    }
    

    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        toField.resignFirstResponder()
        fromField.resignFirstResponder()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
