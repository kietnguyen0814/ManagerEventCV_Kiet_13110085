//
//  HeaderSectionView.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class HeaderSectionView: UICollectionReusableView {
        
    @IBOutlet weak var dayImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    var category: DayCategory!{
        didSet{
            dayLabel.text = category.dayTitle
            dayImage.image = UIImage(named: category.categoryImageName)
        }
    }
}
