//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by ling on 11/2/15.
//  Copyright © 2015 Ling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    @IBOutlet var imageCollection: [UIImageView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TilesList.sharedTilesList.setTilesArray()
        passTImageToImageViews()
        
// flipTile()
        //timer 1
        //timer 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func passTImageToImageViews(){
        for index in 0...15{
            imageCollection[index].image = TilesList.sharedTilesList.tilesArray[index].tileImage
            print(TilesList.sharedTilesList.tilesArray[index].ID)
        }
    
    }
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
//    
//    func flipTile(){
//        // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
//        let fullRotation = CGFloat(M_PI * 2)
////        self.imageCollection![0].image = UIImage(named: "Ling")
//        UIImageView.animateWithDuration(1.0, animations: {
//            // animating `transform` allows us to change 2D geometry of the object
//            // like `scale`, `rotation` or `translate`
//            self.imageCollection![0].image?.animationDidStart(<#T##anim: CAAnimation##CAAnimation#>)
//                transform = CGAffineTransformMakeRotation(fullRotation)
//        })
//    }
 /*
    
    // create a 'tuple' (a pair or more of objects assigned to a single variable)
    var views : (frontView: UIView, backView: UIView)
    
    if(self.redSquare.superview){
    views = (frontView: self.redSquare, backView: self.blueSquare)
    }
    else {
    views = (frontView: self.blueSquare, backView: self.redSquare)
    }
    
    // set a transition style
    let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
    
    // with no animation block, and a completion block set to 'nil' this makes a single line of code
    UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
    
    
    
    
    
    
    let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
    
        // create and add blue-fish.png image to screen
        let fish = UIImageView()
        fish.image = UIImage(named: "blue-fish.png")
        fish.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        self.view.addSubview(fish)
        
        // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
        let fullRotation = CGFloat(M_PI * 2)
        
        UIView.animateWithDuration(1.0, animations: {
            // animating `transform` allows us to change 2D geometry of the object
            // like `scale`, `rotation` or `translate`
            self.fish.transform = CGAffineTransformMakeRotation(fullRotation)
        })
    }
*/



}


