//
//  DataServices.swift
//  Earthquake
//
//  Created by Zindo Yamate on 6/4/18.
//  Copyright © 2018 Zindo Yamate. All rights reserved.
//

import UIKit

class DataServices {
    static let shared: DataServices = DataServices()
    
    func getEarthAPI(complete: @escaping(Earth) -> Void) {
        let urlString = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                guard let aData = data else { return }
                do {
                    if let results = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? DICT {
                        if let earthFeatures = Earth(dict: results) {
                            DispatchQueue.main.async {
                                complete(earthFeatures)
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    }
}
