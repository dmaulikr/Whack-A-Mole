//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by ling on 11/2/15.
//  Copyright © 2015 Ling. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    var gameCount = 0
    var intervalCount = 0
    var difficultyLevel = [3, 2, 1]  //how long each interval timer loop gonna be
    var gameSeconds = 10  // how long the game is going to be
    var intervalSeconds = Int() // how long the interval is going to be
    var gameTimer = NSTimer()
    var intervalTimer = NSTimer()
    var tappedIndex = Int()

    var gameDifficultyBreakPoint = [55, 50, 45]  //at what time adjust the interval speed

    @IBOutlet weak var gameView: UIView!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet weak var gameTimerLabel: UILabel!
    @IBOutlet var tapGesturerOutlet: UITapGestureRecognizer!

    
    override func viewDidLoad() {
        intervalSeconds = difficultyLevel[0]
        super.viewDidLoad()
        setTileArrayPassIageToTile()
        setupGame()
        setupInterval()
        setGesture()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set up Tile
    func passTImageToImageViews(){
        for index in 0...15{
            imageCollection[index].image = TilesList.sharedTilesList.tilesArray[index].tileImage
            print(TilesList.sharedTilesList.tilesArray[index].ID)
        }
    }
    
    func setTileArrayPassIageToTile(){
        TilesList.sharedTilesList.setTilesArray()
        passTImageToImageViews()
    }
    
    //set up game timer
    func setupGame() {
        gameTimerLabel.text = "\(gameSeconds)"
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractGameTime"), userInfo: nil, repeats: true)
    }
    
    func subtractGameTime() {
        gameSeconds--
        gameTimerLabel.text = "\(gameSeconds)"
        if(gameSeconds == 0) {
        gameTimer.invalidate()
        
        }
    }
    
    //set up intervel
    func setupInterval() {
        intervalTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("subtractIntervalTime"), userInfo: nil, repeats: true)
    }
    
    
    func subtractIntervalTime() {
        intervalSeconds--
        print( "\(intervalSeconds)")
        if (gameSeconds > gameDifficultyBreakPoint[0]) {
            if(intervalSeconds == 0) {
                intervalSeconds = difficultyLevel[0]
                print("change tile, difficulty to easy")
                TilesList.sharedTilesList.tilesArray = [Tile]()
                setTileArrayPassIageToTile()
            }
        }
        
        else if (gameSeconds > gameDifficultyBreakPoint[1]) {
            if(intervalSeconds == 0) {
                intervalSeconds = difficultyLevel[1]
                print("change tile image next, difficulty to medium")
                TilesList.sharedTilesList.tilesArray = [Tile]()
                setTileArrayPassIageToTile()
            }
        }
            
        else if (gameSeconds > gameDifficultyBreakPoint[2]) {
            if(intervalSeconds == 0) {
                intervalSeconds = difficultyLevel[2]
                print("change tile image next, difficulty to hard")
                TilesList.sharedTilesList.tilesArray = [Tile]()
                setTileArrayPassIageToTile()
            }
        }
        
        else if (gameSeconds > 0) {
            if(intervalSeconds == 0) {
                intervalSeconds = difficultyLevel[2]
                print("change tile image next")
                TilesList.sharedTilesList.tilesArray = [Tile]()
                setTileArrayPassIageToTile()
            }
        }

        else if (gameSeconds == 0){
            intervalTimer.invalidate()
            
        }
    }
    
    //set up hand gesture
    func setGesture(){
        for index in 0..<16{
            let tileTap = UITapGestureRecognizer(target: self, action: ("handleTap:"))
            imageCollection[index].addGestureRecognizer(tileTap)
            tappedIndex = index
        }
    }
    
    func handleTap(sender:UITapGestureRecognizer){
        if gameSeconds > 0 {
            tappedIndex = sender.view!.tag
            print("\(TilesList.sharedTilesList.tilesArray[tappedIndex].roleName) was tappppppppppppppped")
        }
        else {
            sender.enabled = false
        }
    }
    
    

    @IBAction func tapTileFeedbackTileIndex(sender: UITapGestureRecognizer) {
        
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


