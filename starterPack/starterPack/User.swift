//
//  User.swift
//  starterPack
//
//  Created by Maggie Lucas on 11/11/21.
//

import UIKit

class User: Codable{
    
    // these are all strings for now but maybe we want to make them enums?? strings seems like a lot of chaotic user input to have to parse
    var homeCountry: String
    var timeZone: String
    var currency: String
    var languge: String
    var clothing: String
    var USTimeZone: String
    
    
    init(homeCountry: String, timeZone: String, currency: String, languge: String, clothing: String, USTimezone: String) {
        self.homeCountry = homeCountry
        self.timeZone = timeZone
        self.currency = currency
        self.languge = languge
        self.clothing = clothing
        self.USTimeZone = USTimezone
    }
    
    convenience init() {
        // create sample item to be customized
        self.init(homeCountry: "USA", timeZone: "PST", currency: "USdollar", languge: "english", clothing: "USWomens", USTimezone: "EST")
    }
}
