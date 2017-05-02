//
//  EventDetailTableViewController.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class EventDetailTableViewController: UITableViewController {

    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var image: UIImage?
    var dayEvent: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventImageView.image = image
        dayLabel.text = dayEvent
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
