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
        cell.firstPlace.text = String(properties.place)
        cell.dateLabel.text = properties.time.getCurrentDateTime(convert: properties.time)
        return cell
    }
    

}
