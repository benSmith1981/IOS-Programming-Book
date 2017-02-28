//
//  MyTableViewTableViewController.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import Firebase

class MyTableViewTableViewController: UITableViewController {

    var firebase = FIRDatabase.database().reference()
    var festivalarray: [Festival] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    var currentFestival: Festival?

    var windmillArray: [Windmills] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    var currentWindmill: Windmills?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MyTableViewTableViewController.notifyObservers),
                                               name:  NSNotification.Name(rawValue: "gotWindmillsData" ),
                                               object: nil)
        WindmillsDataRetriever.sharedInstance.retrieveWindmillsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.windmillArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let windmill = windmillArray[indexPath.row]
        cell.textLabel?.text = windmill.eigenaar
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentWindmill = windmillArray[indexPath.row]
        self.performSegue(withIdentifier: "detailView", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailView") {
            let detailView = segue.destination as! DetailViewTableViewController
            detailView.windmill = currentWindmill
        }
    }
 
    func notifyObservers(notification: NSNotification) {
        var windmillsDictionary: Dictionary<String,[Windmills]> = notification.userInfo as! Dictionary<String, [Windmills]>
        windmillArray = windmillsDictionary["windmills"]!
    }
    
}
