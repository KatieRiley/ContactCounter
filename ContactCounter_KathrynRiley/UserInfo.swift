//
//  UserInfo.swift
//  ContactCounter_KathrynRiley
//
//  Created by Katie Ann Riley on 4/6/16.
//  Copyright © 2016 Katie Ann Riley. All rights reserved.
//

import UIKit

class UserInfo: NSObject {

    private var howManyDays:Int!
    private var daysWorn:Int!
    private var pairsOfContacts:Int!
    private var userTodaysDate:NSCalendarUnit!
    
    private let HOW_MANY_DAYS_KEY = "How Many Days Key"
    private let DAYS_WORN_KEY  = "Days Worn Key"
    private let PAIRS_OF_CONTACTS_KEY = "Pairs Of Contacts Key"
     
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    
    func UserInfo() {
        howManyDays = 30
        daysWorn = 0
        pairsOfContacts = -1
        userTodaysDate = NSCalendarUnit.Day
    }
    
    func setHowManyDays (userDays:Int) {
        howManyDays = userDays
    }
    
    func setDaysWorn (userDays:Int) {
        daysWorn = userDays
    }
    
    func setPairsOfContacts (userPairs: Int) {
        pairsOfContacts = userPairs
    }
    
    func setUserTodaysDate (theDate: NSCalendarUnit) {
        userTodaysDate = NSCalendarUnit.Day
    }
    
    
    func getHowManyDays () -> Int {
        return howManyDays
    }
    
    func getDaysWorn () -> Int {
        return daysWorn
    }
    
    func getPairsOfContacts () -> Int {
        return pairsOfContacts!
    }
    
    func getUserTodaysDate() -> NSCalendarUnit {
        return userTodaysDate
    }
    
    func saveInfo () {
        userDefaults.setInteger(howManyDays, forKey: HOW_MANY_DAYS_KEY)
        userDefaults.setInteger(daysWorn, forKey: DAYS_WORN_KEY)
        userDefaults.setInteger(pairsOfContacts, forKey: PAIRS_OF_CONTACTS_KEY)
        
        userDefaults.synchronize()
    }
    
    func reloadUserInfo() {
        howManyDays = userDefaults.integerForKey(HOW_MANY_DAYS_KEY)
        daysWorn = userDefaults.integerForKey(DAYS_WORN_KEY)
        pairsOfContacts = userDefaults.integerForKey(PAIRS_OF_CONTACTS_KEY)
    }
    
}
