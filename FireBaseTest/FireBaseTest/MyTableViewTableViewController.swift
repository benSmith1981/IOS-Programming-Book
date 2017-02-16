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
    
    var windmillSnapshots: [FIRDataSnapshot] = []
//    var windmillSnapshots: [FIRDataSnapshot] = [] {
//        didSet{
//            self.tableView.reloadData()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        WindmillsDataRetriever.sharedInstance.retrieveWindmillsData()
//        WindmillsDataRetriever.sharedInstance.retrieveWindmillsData { (arrayOfWindmills) in
//            self.windmills = arrayOfWindmills
//        }
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
        return self.windmillSnapshots.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let windmillSnapshot: FIRDataSnapshot! = self.windmillSnapshots[indexPath.row]
        guard let windmill = windmillSnapshot.value as? [String:String] else { return cell }
        
        let name = windmill[Constants.windmillFields.Eigenaar] ?? ""
        cell.textLabel?.text = name
        
        return cell
    }
    
    func listenOutForWindmillsData() {
        
        var ref = FIRDatabase.database().reference()
        // Listen for new messages in the Firebase database
        FIRDatabase.database().reference().child("Windmills").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.windmillSnapshots.append(snapshot)
            strongSelf.tableView.insertRows(at: [IndexPath(row: strongSelf.windmillSnapshots.count-1, section: 0)], with: .automatic)
        })
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
