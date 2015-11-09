//
//  MolesList.swift
//  Whack-A-Mole
//
//  Created by ling on 11/3/15.
//  Copyright © 2015 Ling. All rights reserved.
//


import Foundation
import UIKit

class MolesList {
    
    class var sharedMolesList : MolesList {
        struct Singleton {
            static let instance = MolesList()
        }
        return Singleton.instance
    }
    
    private(set) var molesArray:[Role]
    
    init() {
        molesArray = [donaldtrump, wolverines]
    }
    
    
    func addMole(role: Role) {
        molesArray.append(role)
    }
    
    func randomMole() -> Role {
        let unsignedArrayCount = UInt32(MolesList.sharedMolesList.molesArray.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return MolesList.sharedMolesList.molesArray[randomNumber]
    }
}

