//
//  data.swift
//  HealthyLife
//
//  Created by Devansh Shah on 24/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import Foundation

class Data{
    class Entry{
        let filename:String
        let heading:String
        init(fname:String,heading:String) {
            self.heading=heading
            self.filename=fname
        }
}
    let advantages=[
        Entry(fname: "fruits.png", heading: "Fruits and its benefits"),
        Entry(fname: "vegetables.png", heading: "Vegetables and their benefits"),
        Entry(fname: "healthy.png",heading:"Heath Benefits")
    ]
  
}
