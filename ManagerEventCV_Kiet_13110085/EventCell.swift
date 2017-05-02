//
//  EventCell.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    var imageName: String!{
        didSet {
            eventImageView.image = UIImage(named: imageName)
        }
    }
}
