//
//  infoViewController.swift
//  HealthyLife
//
//  Created by Devansh Shah on 24/03/18.
//  Copyright © 2018 Devansh Shah. All rights reserved.
//

import UIKit


class infoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let elements=["Benefits of fruits and vegetables","Benefits of working out","How to stay fit and healthy?","Perks of leading a healthy life"]
    var stuffType:String?

    @IBOutlet weak var infoTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.delegate=self
        infoTable.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        

        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cello=tableView.dequeueReusableCell(withIdentifier: "cello") as! customTableViewCell
        cello.cellLabel.text=elements[indexPath.row]
        cello.cellImage.image=UIImage(named:elements[indexPath.row])
        return cello
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha=0
        let transform=CATransform3DTranslate(CATransform3DIdentity, -250, 30, 0)
        cell.layer.transform=transform
        
        UIView.animate(withDuration: 1){
            cell.alpha=1
            cell.layer.transform=CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc=storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? detailsViewController
        vc?.detailInfo=elements[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
