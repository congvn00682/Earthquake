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
        guard let features = dict["features"] as? DICT else { return nil }
        guard let properties = features["properties"] as? [DICT] else { return nil }
        for pro in properties {
            if let proObject = Properties(dict: pro) {
                self.properties.append(proObject)
            }
        }
    }
}

struct Properties {
    var mag: Double
    var place: String
    var time: TimeInterval
    init?(dict: DICT) {
        guard let mag = dict["mag"] as? Double else { return nil }
        guard let place = dict["place"] as? String else { return nil }
        guard let time = dict["time"] as? TimeInterval else { return nil }
        
        self.mag = mag
        self.place = place
        self.time = time
    }
}
