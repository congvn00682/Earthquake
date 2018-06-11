//
//  Earth.swift
//  Earthquake
//
//  Created by Zindo Yamate on 6/4/18.
//  Copyright © 2018 Zindo Yamate. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class Earth {
    var properties: [Properties] = []
    
    init?(dict: DICT) {
        guard let features = dict["features"] as? [DICT] else { return nil }
        for properties in features {
            if let propertiesObject = Properties(dict: properties) {
                self.properties.append(propertiesObject)
            }
        }
    }
}

struct Properties {
    var mag: Double
    var place: String
    var time: TimeInterval
    var updated: TimeInterval
    
    init?(dict: DICT) {
        guard let properties = dict["properties"] as? DICT else { return nil }
        guard let mag = properties["mag"] as? Double else { return nil }
        guard let place = properties["place"] as? String else { return nil }
        guard let time = properties["time"] as? TimeInterval else { return nil }
        guard let updated = properties["updated"] as? TimeInterval else { return nil }
        
        self.mag = mag
        self.place = place
        self.time = time
        self.updated = updated
    }
}
