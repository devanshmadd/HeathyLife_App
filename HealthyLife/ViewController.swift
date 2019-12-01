//
//  ViewController.swift
//  HealthyLife
//
//  Created by Devansh Shah on 23/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var foodItems=[Food]()
    
    var abc:NSManagedObjectContext!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBAction func addFood(_ sender: UIButton) {
        let foodItem=Food(context:abc)
        foodItem.added=NSDate() as Date
        
        if sender.tag==0{
            foodItem.foodType="Fruits and Vegetables"
        }
        else{
            foodItem.foodType="Workout"
        }
        
        appDelegate?.saveContext()
        
        loadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        abc=appDelegate?.persistentContainer.viewContext
        self.tableView.dataSource=self
        loadData()
    }
    
    @IBAction func startReminding(_ sender: Any) {
        appDelegate?.scheduleNotification()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    
    
    func loadData(){
        let foodRequest:NSFetchRequest<Food>=Food.fetchRequest()
        let sortDescriptor=NSSortDescriptor(key:"added", ascending:false)
        foodRequest.sortDescriptors=[sortDescriptor]
        do{
            try foodItems=abc.fetch(foodRequest)
        }catch{print("could not load data")}
        self.tableView.reloadData()
    }
    
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let foodItem=foodItems[indexPath.row]
        let foodType=foodItem.foodType
        cell.textLabel?.text=foodType
        let foodDate=foodItem.added as! Date
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat="MM dd yyyy, hh:mm"
        
        cell.detailTextLabel?.text=dateFormatter.string(from: foodDate)
        
        if foodType=="Fruits and Vegetables"{
            cell.imageView?.image=UIImage(named:"apple")
        }
        else{
            cell.imageView?.image=UIImage(named:"salad")
        }
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

