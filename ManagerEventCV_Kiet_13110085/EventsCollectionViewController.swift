//
//  EventsCollectionViewController.swift
//  ManagerEventCV_Kiet_13110085
//
//  Created by Kiet Nguyen on 5/2/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class EventsCollectionViewController: UICollectionViewController {

    var dayCategories = DayCategory.fetchPhotos()
    
    struct Storyboard{
        static let eventCell = "EventCell"
        static let headerSectionView = "HeaderSectionView"
        static let showDetailSegue = "ShowDetail"
        
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow : CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDatasourcec
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dayCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayCategories[section].imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.eventCell, for: indexPath) as! EventCell
        let dayCategory = dayCategories[indexPath.section]
        let imageNames = dayCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerSectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.headerSectionView, for: indexPath) as! HeaderSectionView
        let category = dayCategories[indexPath.section]
        
        headerSectionView.category = category
        return headerSectionView
        
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = dayCategories[indexPath.section]
//        let image = UIImage (named: category.imageNames[indexPath.item])
//        let day = category.dayTitle
//        performSegue(withIdentifier: Storyboard.showDetailSegue, sender: nil)
//        performSegue(withIdentifier: Storyboard.showDetailSegue, sender: image)
        // Vụ này làm như thế này không được.
        // Em có thể làm cách khác. Ở đây e lấy image & day, sau đó init cái view controller detail
        // let detailVC UIStoryboard(named: "'...).insta...withIdentifier("ábc"')
        // Tên của storyboard là Main
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailController") as! EventDetailTableViewController

//        detailVC.image = ...
        // Cách làm là như vậy. Set data như khi em prepare seque ở dưới.
        detailVC.dayEvent = category.dayTitle
        detailVC.image = UIImage (named: category.imageNames[indexPath.item])
        
        // Sau đó, do em đang dùng navigation controller để navigate nên self.navigationController chính là cái navigation controller đang wrap vc này.
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        // OK chưa e
        // Tuyet voi luon anh :). Em cam on :)
        // OK, bai lam nhin tuyet do. Co len!
        // da em cam on em lam tiep co gi em se hoi anh tiep a OK
        
    }
    
//    // MARK: Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == Storyboard.showDetailSegue){
//            let eventDetailVC = segue.destination as! EventDetailTableViewController
//            eventDetailVC.image = sender as? UIImage
//            eventDetailVC.dayEvent = sender as? String
//        }
//    }

}
