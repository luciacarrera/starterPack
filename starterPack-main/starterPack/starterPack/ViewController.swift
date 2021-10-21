//
//  ViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/12/21.
//
// Main Menu screen

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        welcome.text = "WELCOME TO STARTERPACK"
    }
    
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



}

