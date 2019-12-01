//
//  customTableViewCell.swift
//  HealthyLife
//
//  Created by Devansh Shah on 24/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
