//
//  EarthTableViewCell.swift
//  Earthquake
//
//  Created by Zindo Yamate on 6/4/18.
//  Copyright © 2018 Zindo Yamate. All rights reserved.
//

import UIKit

class EarthTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mag: UILabel!
    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mag.layer.cornerRadius = mag.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
