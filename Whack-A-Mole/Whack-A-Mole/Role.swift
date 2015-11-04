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
    init(roleImage: UIImage, roleName: String, roleIfMole: Bool){
        self.roleImage = roleImage
        self.roleName = roleName
        self.roleIfMole = true
    }

}

var ling = Role(roleImage: UIImage(named: "Ling")!, roleName: "Ling", roleIfMole: false)
var spartans = Role(roleImage: UIImage(named: "Spartans")!, roleName: "Spartans", roleIfMole: true)
var wolverines = Role(roleImage: UIImage(named: "Wolverines")!, roleName: "Wolverines", roleIfMole: true)

