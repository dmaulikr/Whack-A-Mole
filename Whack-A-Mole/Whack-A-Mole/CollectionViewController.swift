//
//  CollectionViewController.swift
//  Whack-A-Mole
//
//  Created by ling on 11/8/15.
//  Copyright © 2015 Ling. All rights reserved.
//

import UIKit



class CollectionViewController: UICollectionViewController {
    let reuseIdentifier = "cell"
    var tempArray1 = MolesList.sharedMolesList.molesArray
    var tempArray2 = KingsList.sharedKingsList.kingsArray
    let sectionArray = ["Who I want to whack", "Who I don't want to whack", "More roles to pick from"]
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
  
        return 2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        var temp: Int = 0
        if section == 0 {
            
            temp = MolesList.sharedMolesList.molesArray.count
        }
        
        if section == 1 {
            temp = KingsList.sharedKingsList.kingsArray.count
        }
        return temp
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        if indexPath.section == 0{
            cell.cellImage.layer.cornerRadius = cell.cellImage.frame.size.width / 5
            cell.cellImage.clipsToBounds = true
            cell.cellImage.image = tempArray1[indexPath.row].roleImage
            cell.nameLabel.text = tempArray1[indexPath.row].roleName
            
            print("reading the array at index: \(indexPath.row)")
            print("populate cell \(tempArray1[indexPath.row].roleName)")}
        if indexPath.section == 1 {
            cell.cellImage.layer.cornerRadius = cell.cellImage.frame.size.width / 5
            cell.cellImage.clipsToBounds = true
            cell.cellImage.image = UIImage(named: "cat")
            cell.nameLabel.text = "Grumpy Cat"
            print("reading the array at index: \(indexPath.row)")
            print("populate cell \(tempArray2[indexPath.row].roleName)")}

    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView: RoleHeaderReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerViewIdentifier", forIndexPath: indexPath) as! RoleHeaderReusableView
            print("section number : \(indexPath.section)")
            headerView.sectionHeaderLabel.text = sectionArray[indexPath.section]

        return headerView
    }
    
    



}
