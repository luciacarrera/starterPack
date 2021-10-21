//
//  PlusMinusViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class PlusMinusViewController: UIViewController {

    @IBOutlet var plusButton : UIButton!
    @IBOutlet var minusButton : UIButton!
    @IBOutlet var valueLabel : UILabel!
    var value : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func increment(_ sender: UIButton){
        value = value + 1
        updateLabel(value)
    }
    
    @IBAction func decrement(_ sender: UIButton){
        value = value - 1
        updateLabel(value)
    }
    
    func updateLabel(_ newValue: Int){
        if (newValue == 0){
            valueLabel.text = "zero"
        } else {
            valueLabel.text = String(newValue)
        }
        
        if (newValue < 0){
            valueLabel.textColor = UIColor.systemRed;
        } else {
            valueLabel.textColor = UIColor.label;
        }
    
    }

}
