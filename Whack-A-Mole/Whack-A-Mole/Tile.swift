//
//  Title.swift
//  Whack-A-Mole
//
//  Created by ling on 11/3/15.
//  Copyright © 2015 Ling. All rights reserved.
//

import Foundation
import UIKit


class Tile{
    var tileImage: UIImage
    var ID: Int
    var roleIfMole: Bool
    var roleName:String
    var soundFileName: String
    var soundType: String

    
    init(tileImage: UIImage, ID: Int, roleIfMole: Bool, roleName:String, soundFileName: String, soundType: String){
        self.tileImage = tileImage
        self.ID = ID
        self.roleIfMole = roleIfMole
        self.roleName = roleName
        self.soundFileName = soundFileName
        self.soundType = soundType

    }
    
    

}




