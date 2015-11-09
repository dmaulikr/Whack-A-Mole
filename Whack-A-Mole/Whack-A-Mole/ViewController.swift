//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by ling on 11/2/15.
//  Copyright © 2015 Ling. All rights reserved.
//
import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var gameCount = 0
    var intervalCount = 0
    var difficultyLevel = [3, 2, 1]  //how long each interval timer loop gonna be
    var gameSeconds = 45  // how long the game is going to be
    var intervalSeconds = Int() // how long the interval is going to be
    var gameTimer = NSTimer()
    var intervalTimer = NSTimer()
    var tappedIndex = Int()
    var audioPlayerRole : AVAudioPlayer! = nil
    var scoreArray = [Int]()
    var gameDifficultyBreakPoint = [40, 35, 15]  //at what time adjust the interval speed
    

    @IBOutlet weak var gameView: UIView!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet weak var gameTimerLabel: UILabel!
    @IBOutlet var tapGesturerOutlet: UITapGestureRecognizer!
    @IBOutlet weak var mainSLabel1: UILabel!
    @IBOutlet weak var mainSLabel2: UILabel!
    @IBOutlet weak var mainSLabel3: UILabel!

    
    override func viewDidLoad() {
        roundTile()
        intervalSeconds = difficultyLevel[0]
        super.viewDidLoad()
        creatEmptyScoreArray()
        setTileArrayPassIageToTile()
        setupGame()
        setupInterval()
        setGesture()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // round tile
    func roundTile(){
        for tile in imageCollection{
            tile.layer.cornerRadius = tile.frame.size.width / 1.5
            tile.clipsToBounds = true
        }
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

    //set up scoreArray
    func creatEmptyScoreArray(){
        for _ in MolesList.sharedMolesList.molesArray{
            scoreArray.append(0)
        }
        print("IIAM scoreArray.........................................................\(scoreArray)")
    
    }
    
    //set up game timer
    func setupGame() {
        gameTimerLabel.text = "\(gameSeconds)"
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractGameTime"), userInfo: nil, repeats: true)
    }
    func subtractGameTime() {
        intervalCount++
        print("This is the \(intervalCount)th interval.")
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
            moleKingSwitchAffects()

        }
        else {
            sender.enabled = false
        }
    }
    
    
    //set audio
    func playSound(soundFileName: String, type: String){
        let tempAudioPlayer  = self.setupAudioFile(soundFileName, type: type)
        self.audioPlayerRole = tempAudioPlayer
        audioPlayerRole.play()
        audioPlayerRole.volume = 3.0
    }
    func setupAudioFile(file: String, type: String) -> AVAudioPlayer? {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        
        let url = NSURL.fileURLWithPath(path!)
        
        var audioPlayer: AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        return audioPlayer
    }
    func moleKingSwitchAffects(){
        
        // if tapped no mole
        if TilesList.sharedTilesList.tilesArray[tappedIndex].roleIfMole == false {
            print(TilesList.sharedTilesList.tilesArray[tappedIndex].roleIfMole)
            playSound("CatSound", type: "mp3")
        }
        // if tapped mole
        else if TilesList.sharedTilesList.tilesArray[tappedIndex].roleIfMole == true {
            print(TilesList.sharedTilesList.tilesArray[tappedIndex].roleIfMole)
            playSound("WhackSound", type: "wav")
            updateScoreBoard()
        }
        // if tapped secret role
        else  {
            print(TilesList.sharedTilesList.tilesArray[tappedIndex].roleIfMole)
            playSound("CatSound", type: "mp3")
        }
    }
    
    //tracking Score
    func updateDetailScoreSortScoreArray(){
        var index = -1
        for mole in MolesList.sharedMolesList.molesArray{
            index = index + 1
            if  TilesList.sharedTilesList.tilesArray[tappedIndex].roleName == mole.roleName {
                scoreArray[index] = Int(scoreArray[index].value) + 1
                print("the scoreArray is \(scoreArray) .....................................................")
            }
        }
    }
    
    func updateScoreBoard(){
        updateDetailScoreSortScoreArray()
        var tempScoreArray = scoreArray
        var sortedScoreArray = [Int]()
        var tempMoleArray = MolesList.sharedMolesList.molesArray
        var sortedMoleArray = [Role]()
        
        for _ in 0..<scoreArray.count {
            sortedScoreArray.append(tempScoreArray.maxElement()!)
            sortedMoleArray.append(tempMoleArray[tempScoreArray.indexOf(tempScoreArray.maxElement()!)!])
            var tempIndex = tempScoreArray.indexOf(tempScoreArray.maxElement()!)
            tempScoreArray.removeAtIndex(tempIndex!)
            tempMoleArray.removeAtIndex(tempIndex!)
        }
        
        mainSLabel1.text = "\(sortedMoleArray[0].roleName) \(sortedScoreArray[0])"
        
        if sortedMoleArray.count > 1 {
            mainSLabel2.text = "\(sortedMoleArray[1].roleName) \(sortedScoreArray[1])"
        }
        
        if sortedMoleArray.count > 2 {
            mainSLabel3.text = "\(sortedMoleArray[2].roleName) \(sortedScoreArray[2])"
        }

    }
    
    @IBAction func tapTileFeedbackTileIndex(sender: UITapGestureRecognizer) {
        
    }
    
    




}


