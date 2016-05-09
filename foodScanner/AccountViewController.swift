//
//  AccountViewController.swift
//  foodScanner
//
//  Created by Li-Wei Tseng on 5/4/16.
//  Copyright © 2016 Li-Wei Tseng. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var id: UILabel!
    
    @IBAction func logout(sender: AnyObject) {
//        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
//            if error == nil {
//                print("PF logout succeeds")
//            } else {
//                print("PF logout fail")
//            }
//        }
        if KCSUser.activeUser() == nil {
            print("fail")
        } else {
            KCSUser.activeUser().logout()
            self.dismissViewControllerAnimated(true, completion: nil)
            print("success")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if KCSUser.activeUser()?.kinveyObjectId() != nil {
            id.text = KCSUser.activeUser().userId
            username.text = KCSUser.activeUser().username
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
