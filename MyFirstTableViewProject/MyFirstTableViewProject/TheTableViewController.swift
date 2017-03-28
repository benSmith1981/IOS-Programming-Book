//
//  TheTableViewController.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 08/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class TheTableViewController: UITableViewController, UITextFieldDelegate {

    var currentItem: ShoppingItems?
    var shoppingItemArray: [ShoppingItems] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ShoppingListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ShoppingListTableViewCell")
        
        // Register to receive notification data
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TheTableViewController.notifyObservers),
                                               name:  NSNotification.Name(rawValue: "gotShoppingListData" ),
                                               object: nil)

        
        DataProvider.sharedInstance.getShoppingListData()
//        getTheDataFromShoppingService()
    }
    
    
//    func getTheDataFromShoppingService() {
//        //Get the Json Dictionary
//        let JSONDictionary =  as NSDictionary
//        
//        //Get the array of dictionaries use Key "ShoppingItems"
//        let arrayOfDictionaries = JSONDictionary["ShoppingItems"] as! NSArray
//        
//        //Iterate the array
//        for shoppingItemDictionary in arrayOfDictionaries {
//            //Cast the item to a dictionary
//            let shoppingItem = shoppingItemDictionary as! NSDictionary
//            
//            //name string from dictinoary
//            let nameOfItem = shoppingItem["name"] as! String
//            
//            //price integer
//            let priceOfItem = shoppingItem["price"] as! Int
//            
//            //store dictionary item to our object
//            let currentShoppingItem = ShoppingItem.init(name: nameOfItem, price: priceOfItem)
//            
//            //add our shopping item array to our array of Shopping Items
//            shoppingItemArray.append(currentShoppingItem)
//        }
//    }

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
        return shoppingItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShoppingListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
        let currentShoppingItem = shoppingItemArray[indexPath.row]
        cell.setDataForTableCell(shoppingListItem: currentShoppingItem)
        return cell
    }
    
    func notifyObservers(notification: NSNotification) {
        //a)
        var shopItemDict: Dictionary<String,[ShoppingItems]> = notification.userInfo as! Dictionary<String, [ShoppingItems]>
        
        //b)
        shoppingItemArray = shopItemDict["shoppingItems"]!
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            shoppingItemArray.remove(at: indexPath.row)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentItem = shoppingItemArray[indexPath.row] //a)
        self.performSegue(withIdentifier: "detailView", sender: self) //b)
    }
    
    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let itemToMove = shoppingItemArray[fromIndexPath.row]
//        shoppingItemArray.remove(at: fromIndexPath.row)
//        shoppingItemArray.insert(itemToMove, at: to.row)
//    }
 
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.

        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //a)
        if segue.identifier == "detailView" {
            //b)
            let detailView = segue.destination as! DetailViewController
            //c)
            detailView.theItem = currentItem
        }
    }
    

}
