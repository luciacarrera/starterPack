//
//  EmergencyViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class EmergencyViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet var BtnUvmPolice: UIButton!
    @IBOutlet var BtnLucia: UIButton!
    @IBOutlet var BtnEmergency: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    // to be developed to take all numbers and call them
    //@IBAction func call(_ sender: UIButton) {
        
        //print("hello")
        // this function has yet to be tested as the programmer had to use a macincloud and
        // could not try it out
        //guard let number = URL(string: "tel://8028291582" ) else { return }
        //UIApplication.shared.open(number)
    //}
    
    @IBAction func callNumber(_ sender: UIButton){
        var phoneName = ""
        var phoneNumber = ""
        
        if sender == BtnUvmPolice{
            phoneName = "the UVM Police"
            phoneNumber = "+18026563473"
        }
        if sender == BtnLucia{
            phoneName = "Lucia"
            phoneNumber = "+18028291582"
        }
        if sender == BtnEmergency{
            phoneName = "the National Emergency Number"
            phoneNumber = "+1911"
        }
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to call \(phoneName)?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .destructive){_ in
            if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        alertController.addAction(okAction)
               
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               alertController.addAction(cancelAction)
               
               present(alertController, animated: true) // completion: nil
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
