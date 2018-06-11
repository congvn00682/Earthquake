//
//  MasterTableViewController.swift
//  Earthquake
//
//  Created by Zindo Yamate on 6/4/18.
//  Copyright © 2018 Zindo Yamate. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    
    var properties: [Properties] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.shared.getEarthAPI { [unowned self] earth in
            self.properties = earth.properties
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//
//        return header
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return properties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EarthTableViewCell
        let properties = self.properties[indexPath.row]
        cell.mag.text = String(properties.mag)
        let place = String(properties.place)
        if let index = (place.range(of: "of")?.upperBound) {
            let firstPlace = String(place.prefix(upTo: index))
            let secondPlace = String(place.suffix(from: index))
            
            cell.firstPlace.text = firstPlace
            cell.secondPlace.text = secondPlace
        }
        
        cell.dateLabel.text = properties.time.getCurrentDate(convert: properties.time)
        cell.timeLabel.text = properties.updated.getCurrentTime(convert: properties.updated)
        return cell
    }
    

}
