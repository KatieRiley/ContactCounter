//
//  ViewController.swift
//  ContactCounter_KathrynRiley
//
//  Created by Katie Ann Riley on 4/6/16.
//  Copyright © 2016 Katie Ann Riley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactDaysLabel: UILabel!
    //var myUserInformation = UserInfo()
    var theUserDays:Int!
    var howManyDaysWorn = 0
    
    let myUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    let KEY_FOR_FIRST_TIME = "Key For Bool For First Time Use"
    let KEY_ONCE_A_DAY = "Key Once A Day"
    let KEY_WHAT_DAY_LAST_USED = "Key What Day Last Used"
    private let DAYS_WORN_KEY  = "Days Worn Key"
    private let PAIRS_OF_CONTACTS_KEY = "Pairs Of Contacts Key"

 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //myUserInformation.reloadUserInfo()
        //if (myUserInformation.getHowManyDays() == 0){
          //  myUserInformation.setHowManyDays(30)
        //}
        
        //theUserDays = myUserInformation.getHowManyDays()
        theUserDays = myUserDefaults.integerForKey(DAYS_WORN_KEY)
        updateDaysLabel()
    }
    
    override func viewDidAppear(animated: Bool) {
        if !myUserDefaults.boolForKey(KEY_FOR_FIRST_TIME)
        {
            performSegueWithIdentifier("WelcomeViewControler", sender: self)
            myUserDefaults.setBool(false, forKey: KEY_ONCE_A_DAY)
            myUserDefaults.synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func youBetchaButtonClick(sender: AnyObject) {
        
        howManyDaysWorn += 1
        
        if (myUserDefaults.boolForKey(KEY_ONCE_A_DAY) == false) {
            
            if (howManyDaysWorn >= theUserDays) {
                let msg = "You should change your contacts. You have worn you contacts for \(howManyDaysWorn) days now!"
                let firstAlert = UIAlertController(title: "Change is a-brewing!", message: msg, preferredStyle: .ActionSheet)
                let yesAction = UIAlertAction(title: "Got it!", style: .Destructive, handler: {
                    action in
                    let resetConfirmAlert = UIAlertController(title: "Awesome! Your days have been reset!", message: "Are you sure you changed your contacts?", preferredStyle: .Alert)
                    let confirmAction = UIAlertAction(title: "Yes I'm sure", style: .Default, handler: {
                        (action: UIAlertAction!) in
                        self.howManyDaysWorn = 0
                        //self.myUserInformation.setHowManyDays(0)
                        self.myUserDefaults.setInteger(0, forKey: self.DAYS_WORN_KEY)
                        self.updateDaysLabel()
                        
                    })
                    let cancelAction = UIAlertAction(title: "Give me a few more days", style: .Cancel, handler: nil)
                    
                    resetConfirmAlert.addAction(confirmAction)
                    resetConfirmAlert.addAction(cancelAction)
                    self.presentViewController(resetConfirmAlert, animated: true, completion: nil)
                })
                
                let noAction = UIAlertAction(title: "I'll do it later thanks!", style: .Cancel, handler: nil)
                
                firstAlert.addAction(yesAction)
                firstAlert.addAction(noAction)
                self.presentViewController(firstAlert, animated: true, completion: nil)
                
            }
            

        }
        
        //myUserInformation.setHowManyDays(theUserDays)
        myUserDefaults.setInteger(theUserDays, forKey: DAYS_WORN_KEY)
        myUserDefaults.synchronize()
        self.updateDaysLabel()
        
    }
    
    
    func updateDaysLabel () {
        if (howManyDaysWorn == 0){
            contactDaysLabel.text = "Woo Hoo! Fresh start, this is your first day wearing your contacts!"
        }
        else if (howManyDaysWorn == 1) {
            contactDaysLabel.text = "You have worn you contacts for \(howManyDaysWorn) day now!"
        }
        else {
            contactDaysLabel.text = "You have worn you contacts for \(howManyDaysWorn) days now!"
        }
    }

}

