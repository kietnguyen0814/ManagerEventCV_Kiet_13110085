//
//  DayCategory.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

//
//  Event.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import Foundation


struct DayCategory {
    var categoryImageName: String
    var dayTitle: String
    var imageNames: [String]
    
    static func fetchPhotos() -> [DayCategory] {
        var categories = [DayCategory]()
        let photosData = EventsLibrary.downloadPhotosData()
        
        for (categoryName, dict) in photosData {
            if let dict = dict as? [String : Any] {
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String] {
                    let newCategory = DayCategory(categoryImageName: categoryImageName, dayTitle: categoryName, imageNames: imageNames)
                    categories.append(newCategory)
                }
            }
        }
        
        return categories
    }
}

class EventsLibrary
{
    class func downloadPhotosData() -> [String : Any]
    {
        return [
            "Sunday" : [
                "categoryImageName" : "sunday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "su", numberOfImages: 10),
            ],
            "Monday" : [
                "categoryImageName" : "monday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "mo", numberOfImages: 10),
            ],
            "Tuesday" : [
                "categoryImageName" : "tuesday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "tu", numberOfImages: 10),
            ],
            "Wednesday" : [
                "categoryImageName" : "wednesday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "we", numberOfImages: 10),
            ],
            "Thursday" : [
                "categoryImageName" : "thursday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "th", numberOfImages: 10),
            ],
            "Friday" : [
                "categoryImageName" : "friday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "fr", numberOfImages: 10),
            ],
            "Saturday" : [
                "categoryImageName" : "saturday",
                "imageNames" : EventsLibrary.generateImage(categoryPrefix: "sa", numberOfImages: 10),
            ]
        ]
    }
    
    private class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String] {
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        
        return imageNames
    }
}
