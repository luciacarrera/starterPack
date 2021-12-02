//
//  ViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/12/21.
//
// Main Menu screen
// initial View

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        welcome.text = "WELCOME TO STARTERPACK"
    }
    
    // establish user variable to store all user data
    var user: User!
    

    
    //initialize label and buttons
    @IBOutlet var welcome: UILabel!
    @IBOutlet var temperatureButton: UIButton!
    @IBOutlet var currencyButton: UIButton!
    @IBOutlet var measureButton: UIButton!
    @IBOutlet var timeButton: UIButton!
    @IBOutlet var trafficButton: UIButton!
    @IBOutlet var clothingButton: UIButton!
    @IBOutlet var phrasesButton: UIButton!
    @IBOutlet var translateButton: UIButton!
    @IBOutlet var emergencyButton: UIButton!

    // pass user to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if i could figure out how to declare newViewController out here
        // i could save SO MANY lines of code -- i just dont know the data type??
        switch segue.identifier {
        case "toUser":
            // identify which new view controller is opening
            let newViewController = segue.destination as! profileSetupViewController
            let u = user
            newViewController.user = u
        case "toTemp":
            // identify which new view controller is opening
            let newViewController = segue.destination as! TemperatureViewController
            let u = user
            newViewController.user = u
        case "toTime":
            // identify which new view controller is opening
            let newViewController = segue.destination as! TimeViewController
            let u = user
            newViewController.user = u
        case "toCurr":
            // identify which new view controller is opening
            let newViewController = segue.destination as! CurrencyViewController
            let u = user
            newViewController.user = u
        case "toMeasure":
            // identify which new view controller is opening
            let newViewController = segue.destination as! MeasurementViewController
            let u = user
            newViewController.user = u
        case "toTraffic":
            // identify which new view controller is opening
            let newViewController = segue.destination as! TrafficViewController
            let u = user
            newViewController.user = u
        case "toClothes":
            // identify which new view controller is opening
            let newViewController = segue.destination as! ClothingViewController
            let u = user
            newViewController.user = u
        case "toPhrases":
            // identify which new view controller is opening
            let newViewController = segue.destination as! PhrasesViewController
            let u = user
            newViewController.user = u
        case "toTranslate":
            // identify which new view controller is opening
            let newViewController = segue.destination as! TranslateViewController
            let u = user
            newViewController.user = u
        case "toEmergency":
            // identify which new view controller is opening
            let newViewController = segue.destination as! EmergencyViewController
            let u = user
            newViewController.user = u
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
