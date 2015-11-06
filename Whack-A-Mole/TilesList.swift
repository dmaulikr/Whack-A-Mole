//
//  TilesList.swift
//  Whack-A-Mole
//
//  Created by ling on 11/3/15.
//  Copyright © 2015 Ling. All rights reserved.
//


import Foundation
import UIKit

class TilesList {
    
    class var sharedTilesList : TilesList {
        struct Singleton {
            static let instance = TilesList()
        }
        return Singleton.instance
    }
    
    //private(set)
    var tilesArray:[Tile]
    
    init() {
        tilesArray = [Tile]()
    }
    
      
    func setTilesArray() -> [Tile]{
        for index in 1...16 {
            var tempTile = setRoleToSingleTile()
            tempTile = Tile(tileImage: tempTile.tileImage, ID: index, roleIfMole: tempTile.roleIfMole, roleName: tempTile.roleName,soundFileName: tempTile.soundFileName, soundType: tempTile.soundType)
            
            tilesArray.append(tempTile)
        }
            return tilesArray
    }
    
    
    func setRoleToSingleTile() -> Tile {
        var randomRole = Role(roleImage: UIImage(named: "cat")!, roleName: "baba", roleIfMole: true, soundFileName: "" , soundType: "")
        var roleIfMole = true
        var tempTile: Tile
        let unsignedChoiceCount = UInt32(2)
        let unsignedRandomNumber = arc4random_uniform(unsignedChoiceCount)
        let choiceNumber = Int(unsignedRandomNumber)
        print("\(choiceNumber) is the Mole or King choice")
        if choiceNumber == 0 {
            randomRole = MolesList.sharedMolesList.randomMole()
            if randomRole.soundFileName == ""{
                randomRole.soundFileName = "CatSound"
                randomRole.soundType = "mp3"
            }
            print("\(randomRole.roleName) for this Tile,  (randomRole.soundFileName)")
            roleIfMole = true
        }
        if choiceNumber == 1 {
            randomRole = KingsList.sharedKingsList.randomKing()
            if randomRole.soundFileName == ""{
                randomRole.soundFileName = "WhackSound"
                randomRole.soundType = "wav"
            }
            print("\(randomRole.roleName) for this Tile,  (randomRole.soundFileName)")
            roleIfMole = false
        }
        tempTile = Tile(tileImage:randomRole.roleImage, ID: 10, roleIfMole: roleIfMole, roleName:randomRole.roleName, soundFileName: randomRole.soundFileName, soundType: randomRole.soundType)
        return tempTile
    }

}
