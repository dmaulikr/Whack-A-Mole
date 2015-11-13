//
//  NationalRecordTableViewController.swift
//  Whack-A-Mole
//
//  Created by ling on 11/11/15.
//  Copyright © 2015 Ling. All rights reserved.
//

import UIKit
import Parse

class NationalRecordTableViewController: UITableViewController {
    var score = [Int]()
    var dates = [String]()
    var tempArray = [PFObject]()
    
    

    @IBOutlet var tabelView: UITableView!
    
    override func viewDidLoad() {
        fetchScoreDatafromParse()
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of rows
        return tempArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        var scoreString = String()
        var dateString = String()
//        var scoreString1 = String()
        
        if let tempScore: PFObject = self.tempArray[indexPath.row] {
            print("bababababa-------------------------------------------------")
            print(tempScore)
            
            if let date = tempScore.updatedAt {
                print("__________________")
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy"
                dateString = dateFormatter.stringFromDate(date)


                print(dateString)
            } else {
                print("Cannot create date object")
            }
            
            
            if let score = tempScore.objectForKey("donaldTrump") as? Int {
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print(tempScore)
                 scoreString = "\(score)"
            }



        
            cell.textLabel!.text = "\(scoreString)times on \(dateString)"
            cell.detailTextLabel?.text = "by a User in Michigan"
    

        return cell
        }
    }
    

    func fetchScoreDatafromParse() {
        
        var tempGameScore = String()
        var tempTime = String()
        let query = PFQuery(className:"GameResult")
         query.findObjectsInBackgroundWithBlock{ (GameResult: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for result in GameResult! {
//                     self.downloadedHero.name = object["name"] as! String
                    self.tempArray = [result] + self.tempArray
                    //self.tempArray.append(result)
                    print(self.tempArray.count)
                    print("fetching and append arrary -----------------------------------------------------")
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    




    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
