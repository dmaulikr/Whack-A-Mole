//
//  Role.swift
//  Whack-A-Mole
//
//  Created by ling on 11/3/15.
//  Copyright © 2015 Ling. All rights reserved.
//

import Foundation
import UIKit

class Role {
    var roleImage: UIImage
    var roleName: String
    var roleIfMole: Bool
    var soundFileName: String
    var soundType: String
    init(roleImage: UIImage, roleName: String, roleIfMole: Bool, soundFileName: String, soundType: String){
        self.roleImage = roleImage
        self.roleName = roleName
        self.roleIfMole = roleIfMole
        self.soundFileName = soundFileName
        self.soundType = soundType
    }

}

//var ling = Role(roleImage: UIImage(named: "Ling")!, roleName: "Ling", roleIfMole: false, soundFileName: cast)
var cat = Role(roleImage: UIImage(named: "cat")!, roleName: "cat", roleIfMole: false, soundFileName: "CatSound ", soundType: "mp3")
var spartans = Role(roleImage: UIImage(named: "Spartans")!, roleName: "Spartans", roleIfMole: true,  soundFileName: "WhatSound", soundType: "wav")
var wolverines = Role(roleImage: UIImage(named: "Wolverines")!, roleName: "Wolverines", roleIfMole: true,  soundFileName: "WhatSound", soundType: "wav")

