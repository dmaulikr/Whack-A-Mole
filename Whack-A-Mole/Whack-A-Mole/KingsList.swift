
//
//  KingsList.swift
//  Whack-A-Mole
//
//  Created by ling on 11/3/15.
//  Copyright © 2015 Ling. All rights reserved.
//


import Foundation
import UIKit

class KingsList {
    
    class var sharedKingsList : KingsList {
        struct Singleton {
            static let instance = KingsList()
        }
        return Singleton.instance
    }
    
    private(set) var kingsArray:[Role]
    
    init() {
        kingsArray = [ling]
    }

    
    func addKing(role: Role) {
        kingsArray.append(role)
    }
    
    
    func randomKing() -> Role {
        let unsignedArrayCount = UInt32(KingsList.sharedKingsList.kingsArray.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return KingsList.sharedKingsList.kingsArray[randomNumber]
    }
}
