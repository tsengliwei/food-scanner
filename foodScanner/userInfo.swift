//
//  userInfo.swift
//  foodScanner
//
//  Created by Liaolily on 5/18/16.
//  Copyright © 2016 Li-Wei Tseng. All rights reserved.
//

import UIKit

class userInfo: NSObject {
    var entityId: String? //Kinvey entity _id
    var name: String?
    var calories: NSValue?
    var fat: NSValue?
    var carbo: NSValue?
    var protein: NSValue?
    var sodium: NSValue?
    
    var date: NSDate?
    var metadata: KCSMetadata? //Kinvey metadata, optional
    
    
    
    internal override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "name" : "name",
            "calories" : "calories",
            "fat" : "fat",
            "carbo" : "carbo",
            "protein" : "protein",
            "sodium" : "sodium",
            "date" : "date",
            "metadata" : KCSEntityKeyMetadata //optional _metadata field
        ]
    }
}
