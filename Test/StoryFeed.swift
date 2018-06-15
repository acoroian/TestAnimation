//
//  ViewController.swift
//  Test
//
//  Created by Adrian Coroian on 6/12/18.
//  Copyright © 2018 Adrian Coroian. All rights reserved.
//

import UIKit
class StoryFeed: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    override func viewDidLoad() {

    }

    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width: size.width-40, height: (size.width-40)*1.3)
    }
    
    
    // tell the collection view how many cells to make
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ImageCell
        
//        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 8
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cell.layer.shadowOpacity = 0.6
        
        let cardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        cell.card?.shouldPresent(cardContent, from: self, fullscreen: true)
        cell.card?.title = "test title"
        cell.card?.subtitle = "test subtitle"
        cell.card?.category = "Smart Cards"
        cell.card?.backgroundImage = UIImage(named: "cardImage")
        
        (cardContent as? DetailViewController)?.detailLabel?.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle tap events
//        print("You selected cell #\(indexPath.item)!")
//
//        let groupCardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
//        group.shouldPresent(groupCardContent, from: self)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detail" {
//            segue.destination.transitioningDelegate = self
//        }
//    }
}
