//
//  WelcomeViewController.swift
//  ContactCounter_KathrynRiley
//
//  Created by Katie Ann Riley on 4/8/16.
//  Copyright © 2016 Katie Ann Riley. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let HOW_MANY_DAYS_KEY = "How Many Days Key"
    let myUserDefaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
    @IBAction func setUserInput(sender: AnyObject) {
        
        if (userTextField.text?.isEmpty == true){
            
            myUserDefaults.setInteger(30, forKey: HOW_MANY_DAYS_KEY)
        }
        else{
            myUserDefaults.setInteger(Int(userTextField.text!)!, forKey: HOW_MANY_DAYS_KEY)
        }
        myUserDefaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
