//
//  EmergencyViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class EmergencyViewController: UIViewController {
    
    @IBOutlet var btn911: UIButton!
    @IBOutlet var btnPoision: UIButton!
    @IBOutlet var btnLucia: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    // to be developed to take all numbers and call them
    @IBAction func call(_ btnLucia: UIButton) {
        // this function has yet to be tested as the programmer had to use a macincloud and
        // could not try it out
        guard let number = URL(string: "tel://8028291582" ) else { return }
        UIApplication.shared.open(number)
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
