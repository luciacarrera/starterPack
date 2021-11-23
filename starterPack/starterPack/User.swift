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
    var language: String
    var clothing: String
    var americanTimeZone: String
    
    
    init(homeCountry: String, timeZone: String, currency: String, language: String, clothing: String, americanTimeZone: String) {
        self.homeCountry = homeCountry
        self.timeZone = timeZone
        self.currency = currency
        self.language = language
        self.clothing = clothing
        self.americanTimeZone = americanTimeZone
    }
    
    convenience init() {
        // create sample item to be customized
        self.init(homeCountry: "USA", timeZone: "", currency: "", language: "", clothing: "", americanTimeZone: "")
    }
}
