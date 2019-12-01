//
//  BMICalcViewController.swift
//  HealthyLife
//
//  Created by Devansh Shah on 26/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import UIKit

class BMICalcViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var BMIValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var BMIcalculated: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        statusLabel.layer.masksToBounds=true
        statusLabel.layer.cornerRadius=4
    }

    @IBAction func heightValueChange(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        heightValue.text = "\(currentValue) inches"
        self.calculateBMI()
    }
    
    
    @IBAction func weightValueChange(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        weightValue.text = "\(currentValue) pounds"
        self.calculateBMI()
    }
    
    private func calculateBMI() {
        let height: Float = heightSlider.value
        let weight: Float = weightSlider.value
        let bmi: Float = (weight / (height*height)) * 703
        
        
        BMIcalculated.text = "\(bmi)"
        self.changeStatus(bmi: bmi)
    }
    
    private func changeStatus(bmi: Float) {
        if (bmi < 18.5) {
            statusLabel.text = "underweight"
            statusLabel.textColor = UIColor.blue
        } else if (bmi >= 18.5 && bmi < 24.9) {
            statusLabel.text = "normal"
            statusLabel.textColor = UIColor.orange
        } else if (bmi >= 25 && bmi < 29.9) {
            statusLabel.text = "pre-obese"
            statusLabel.textColor = UIColor.purple
        } else {
            statusLabel.text = "obese"
            statusLabel.textColor = UIColor.red
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
