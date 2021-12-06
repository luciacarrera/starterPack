//
//  TimeViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit

class TimeViewController: UIViewController {
    
    var user: User!

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* CONSTANTS */
        // the following constant should become a global constant in next versions
        let visitingCity = "New York"
        let homeCity = "Madrid"
        let homeTimeZone = "CEST"
        
        /* TEXT LABELS */
        var str = "In " + visitingCity + ", it is"
        visitingTimeLabel.text = str
        str = "In "+homeCity + ", it is"
        homeTimeLabel.text = str
        
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
        dateFormatter.timeZone = TimeZone(abbreviation: homeTimeZone)
        let hTime = timeFormatter.string(from: date).lowercased()
        let hDate = dateFormatter.string(from: date)
        homeTime.text = hTime
        homeDate.text = hDate
        print(hDate <  vDate)

        /* DIFFERENCE LABEL */
        // initialization of var to print out
        var timeDifferenceString = ""

        // getting hours to do the math optional binding
        if let hHour = Int(hTime.prefix(2)), let vHour = Int(vTime.prefix(2)){
            // math part
            var diff = 0
            if hDate <  vDate{
                diff = 24 - vHour + hHour
            }else if vDate > hDate{
                diff = 24 - hHour + vHour
            }
            else if hHour > vHour{
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
}
