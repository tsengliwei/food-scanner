//
//  DashboardViewController.swift
//  foodScanner
//
//  Created by Liaolily on 5/17/16.
//  Copyright © 2016 Li-Wei Tseng. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet var callabel: UILabel!
    @IBOutlet var calories: UIProgressView!
    @IBOutlet var fatlabel: UILabel!
    @IBOutlet var fatpro: UIProgressView!
    @IBOutlet var carbolabel: UILabel!
    @IBOutlet var carbopro: UIProgressView!
    @IBOutlet var proteinlabel: UILabel!
    @IBOutlet var proteinpro: UIProgressView!
    @IBOutlet var sodiumlabel: UILabel!
    @IBOutlet var sodiumpro: UIProgressView!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.diebete = false
        variables.hypertension = false

    }
    
    

    override func viewDidAppear(animated: Bool) {
        var calLimit = Float(2000)
        let fatLimit = Float(65)
        var carboLimit = Float(300)
        let proteinLimit = Float(50)
        var sodiumLimit = Float(2400)
        
        
        if variables.diebete == true && variables.hypertension == false{
            calLimit = Float(1500)
            carboLimit = Float(200)
            sodiumLimit = Float(2300)
            UIView.animateWithDuration(0.5, animations: {
                self.view2.alpha = 1
                self.view1.alpha = 0
                self.view3.alpha = 0
            })
        }
        else if variables.hypertension == true && variables.diebete == false{
            sodiumLimit = Float(120)
            UIView.animateWithDuration(0.5, animations: {
                self.view3.alpha = 1
                self.view1.alpha = 0
                self.view2.alpha = 0
            })
        }
        else if variables.diebete == true && variables.hypertension == true {
            calLimit = Float(1500)
            carboLimit = Float(200)
            sodiumLimit = Float(2300)
            sodiumLimit = Float(120)
        }
        else if variables.diebete == false && variables.hypertension == false{
            self.view1.alpha = 1
            self.view3.alpha = 0
            self.view2.alpha = 0
        }
        callabel.text = ("\(KCSUser.activeUser().getValueForAttribute("calories"))/\(calLimit)")
        print(KCSUser.activeUser().getValueForAttribute("calories"))
        calories.progress = Float(KCSUser.activeUser().getValueForAttribute("calories") as! Double)/calLimit
        fatlabel.text = ("\(KCSUser.activeUser().getValueForAttribute("fat"))/\(fatLimit)")
        fatpro.progress = Float(KCSUser.activeUser().getValueForAttribute("fat") as! Double)/fatLimit
        carbolabel.text = ("\(KCSUser.activeUser().getValueForAttribute("carbo"))/\(carboLimit)")
        carbopro.progress = Float(KCSUser.activeUser().getValueForAttribute("carbo") as! Double)/carboLimit
        proteinlabel.text = ("\(KCSUser.activeUser().getValueForAttribute("protein"))/\(proteinLimit)")
        proteinpro.progress = Float(KCSUser.activeUser().getValueForAttribute("protein") as! Double)/proteinLimit
        sodiumlabel.text = ("\(KCSUser.activeUser().getValueForAttribute("sodium"))/\(sodiumLimit)")
        sodiumpro.progress = Float(KCSUser.activeUser().getValueForAttribute("sodium") as! Double)/sodiumLimit
        
        KCSUser.activeUser().refreshFromServer{ (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
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
