//
//  NutritionTableViewController.swift
//  foodScanner
//
//  Created by Li-Wei Tseng on 4/23/16.
//  Copyright © 2016 Li-Wei Tseng. All rights reserved.
//

import UIKit

class NutritionTableViewController: UITableViewController {
    
    var nutritionInfoRaw : AnyObject?
    var nutritionInfo : Dictionary<String, AnyObject>?
    var arrayofKeys : [String]?
    var arrayofValues : [AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        modifyNutritionInfo()
//        self.tableView.registerClass(UITableViewCell(), forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helper
    func modifyNutritionInfo() {
        if let jsonResult = nutritionInfoRaw as? Dictionary<String, AnyObject> {
            nutritionInfo = jsonResult
            nutritionInfo?.removeValueForKey("usda_fields")
            nutritionInfo?.removeValueForKey("brand_id")
            nutritionInfo?.removeValueForKey("item_id")
            nutritionInfo?.removeValueForKey("nf_refuse_pct")
            nutritionInfo?.removeValueForKey("leg_loc_id")
            nutritionInfo?.removeValueForKey("updated_at")
//          nutritionInfo?.removeValueForKey("leg_loc_id")
            
            
            arrayofKeys = ["Calories", "Calories from Fat", "Total fat", "Saturated Fat", "Trans Fat", "Polyunsaturated Fat", "Monounsaturated Fat", "Cholesterol", "Sodium", "Total Carbohydrate", "Dietary Fiber", "Sugars", "Protein","Vitamin A", "Vitamin C", "Calcium", "Iron"]
            print(Int(nutritionInfo?["nf_calories"] as! Int))
            let info1 = nutritionInfo!["nf_calories"]
            let info2 = nutritionInfo?["nf_calories_from_fat"]
            let info3 = nutritionInfo?["nf_total_fat"]
            let info4 = nutritionInfo?["nf_saturated_fat"]
            let info5 = nutritionInfo?["nf_trans_fatty_acid"]
            let info6 = nutritionInfo?["nf_polyunsaturated_fat"]
            let info7 = nutritionInfo?["nf_monounsaturated_fat"]
            let info8 = nutritionInfo?["nf_cholesterol"]
            let info9 = nutritionInfo?["nf_sodium"]
            let info10 = nutritionInfo?["nf_total_carbohydrate"]
            let info11 = nutritionInfo?["nf_dietary_fiber"]
            let info12 = nutritionInfo?["nf_sugars"]
            let info13 = nutritionInfo?["nf_protein"]
            let info14 = nutritionInfo?["nf_vitamin_a_dv"]
            let info15 = nutritionInfo?["nf_vitamin_c_dv"]
            let info16 = nutritionInfo?["nf_calcium_dv"]
            let info17 = nutritionInfo?["nf_iron_dv"]
                
            arrayofValues = [info1!,info2!,info3!,info4!,info5!,info6!,info7!,info8!,info9!,info10!,info11!,info12!,info13!,info14!,info15!,info16!,info17!]
//            arrayofValues = [Int(nutritionInfo!["nf_calories"] as? Int)!, Int(nutritionInfo?["nf_calories_from_fat"] as? Int), Int(nutritionInfo?["nf_total_fat"] as? Int), Int(nutritionInfo?["nf_saturated_fat"] as? Int), Int(nutritionInfo?["nf_trans_fatty_acid"] as? Int), Int(nutritionInfo?["nf_polyunsaturated_fat"] as? Int), Int(nutritionInfo?["nf_monounsaturated_fat"] as? Int), Int(nutritionInfo?["nf_cholesterol"] as? Int), Int(nutritionInfo?["nf_sodium"] as? Int), Int(nutritionInfo?["nf_total_carbohydrate"] as? Int), Int(nutritionInfo?["nf_dietary_fiber"] as? Int), Int(nutritionInfo?["nf_sugars"] as? Int), Int(nutritionInfo?["nf_protein"] as? Int), Int(nutritionInfo?["nf_vitamin_a_dv"] as? Int), Int(nutritionInfo?["nf_vitamin_c_dv"] as? Int), Int(nutritionInfo?["nf_calcium_dv"] as? Int), Int(nutritionInfo?["nf_iron_dv"] as? Int)]
        } else {
            debugPrint(nutritionInfoRaw)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 17
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
       cell.textLabel!.text = arrayofKeys![indexPath.row] // nutrition name
                //let arrayOfKeys: [String]
        let value = arrayofValues![indexPath.row]
        print(nutritionInfo)
        if value is NSNull {
            cell.detailTextLabel?.text = "N/A"
        } else {
            
            cell.detailTextLabel?.text = String(value)
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
