//
//  Extension+TimeInterval.swift
//  Earthquake
//
//  Created by Vu Ngoc Cong on 6/5/18.
//  Copyright © 2018 Zindo Yamate. All rights reserved.
//

import UIKit

extension TimeInterval {
    func getCurrentDate(convert dateTimeInterval: TimeInterval) -> String{
        let formater = DateFormatter()
        // lay thu tư TimeInterval
        formater.dateFormat = "MMMM dd, yyyy"
        // chuyen doi thanh tieng viet
//        formater.locale = Locale(identifier: "vi-VN")
        // lay gio he thong
        let today = formater.string(from: Date(timeIntervalSince1970: dateTimeInterval))
        let date = Date()
        let currentDate = formater.string(from: date)
        return currentDate == today ? today : today
        
    }
    
    func getCurrentTime(convert dateTimeInterval: TimeInterval) -> String{
        let formater = DateFormatter()
        // lay thu tư TimeInterval
        formater.dateFormat = "HH:mm a"
        // chuyen doi thanh tieng viet
        //        formater.locale = Locale(identifier: "vi-VN")
        // lay gio he thong
        let today = formater.string(from: Date(timeIntervalSince1970: dateTimeInterval))
        let date = Date()
        let currentDate = formater.string(from: date)
        return currentDate == today ? today : today
        
    }

}
