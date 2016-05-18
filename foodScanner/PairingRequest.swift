//
//  ParingRequest.swift
//  foodScanner
//
//  Created by Li-Wei Tseng on 5/8/16.
//  Copyright © 2016 Li-Wei Tseng. All rights reserved.
//

import Foundation

class PairingRequest: NSObject{
    var entityId: String? //Kinvey entity _id
    var brand_name: String?
    var item_name: String?
    var geocoord: CLLocation?
    var metadata: KCSMetadata? //Kinvey metadata, optional
    var phone: String?
    var date: NSDate?
    
    internal override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field,
            "brand_name" : "brand_name",
            "item_name" : "item_name",
            "geocoord" : KCSEntityKeyGeolocation, //geo location
            "metadata" : KCSEntityKeyMetadata, //metadata
            "phone" : "phone",
            "date" : "date"
        ]
    }
}