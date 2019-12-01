//
//  detailsViewController.swift
//  HealthyLife
//
//  Created by Devansh Shah on 24/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {


    
    @IBOutlet weak var finalLbl: UILabel!
    var detailInfo:String!
        
        // Do any additional setup after loading the view.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalLbl.text=detailInfo
        if finalLbl.text=="Benefits of fruits and vegetables"{
           
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
