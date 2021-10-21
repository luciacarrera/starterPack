//
//  TimeViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class TimeViewController: UIViewController {
    //labels - home country
    @IBOutlet var homeTimeLabel: UILabel!
    @IBOutlet var homeTime: UILabel!
    @IBOutlet var homeDate: UILabel!

    //labels - visiting country
    @IBOutlet var visitingTimeLabel: UILabel!
    @IBOutlet var visitingTime: UILabel!
    @IBOutlet var visitingDate: UILabel!
    
    // labels - time difference
    @IBOutlet var timeDifference: UILabel!

    //buttons
    @IBOutlet var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* CONSTANTS */
        // the following constant should become a global constant in next versions
        let visitingCity = "New York"
        let homeCity = "Madrid"
        let homeTimeZone = "CEST"
        
        /* TEXT LABELS */
        visitingTimeLabel.text = "In "+visitingCity + ", it is"
        homeTimeLabel.text = "In " + homeCity + ", it is"
        
        /* VISITING TIME AND DATE LABELS */
        // Initialization of swift date, calendar and dateformatter objects
        let date = Date()
        let timeFormatter = DateFormatter()
        let dateFormatter = DateFormatter()

        // Formatting of time to appear
        timeFormatter.dateFormat = "HH:mm a"
        dateFormatter.dateFormat = "EEEE, LLLL dd"

        // text to appear on screen
        let vTime = timeFormatter.string(from: date).lowercased()
        let vDate = dateFormatter.string(from: date)
        visitingTime.text = vTime
        visitingDate.text = vDate

        
        /* HOME TIME AND DATE LABELS */
        timeFormatter.timeZone = TimeZone(abbreviation: homeTimeZone)
        let hTime = timeFormatter.string(from: date).lowercased()
        let hDate = dateFormatter.string(from: date)
        homeTime.text = hTime
        homeDate.text = hDate

        /* DIFFERENCE LABEL */
        // initialization of var to print out
        var timeDifferenceString = ""

        // getting hours to do the math optional binding
        if let hHour = Int(hTime.prefix(2)), let vHour = Int(vTime.prefix(2)){
            // math part
            var diff = 0
            if hDate > vDate{
                diff = hHour - vHour
            }else{
                diff = vHour - hHour
            }
            var diffStr = ""
            
            //first compare dates
            
            // determine if ahead or behind
            if diff >= 0 {
                diffStr = "ahead"
            } else{
                diffStr = "behind"
            }
            // string to print out
            timeDifferenceString = homeCity + " is " + String(abs(diff)) + " hours " + diffStr
            
        }else{
            timeDifferenceString = "error"
        }
        
        timeDifference.text = timeDifferenceString
        
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
