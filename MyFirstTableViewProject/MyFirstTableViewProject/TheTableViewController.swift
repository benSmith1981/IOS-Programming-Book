//
//  TheTableViewController.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 08/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class TheTableViewController: UITableViewController, UITextFieldDelegate {

//    var shoppingList = ["Item1","Shoes", "Clothes","Coffee"]//,"Item2","Item4","Item1","Item1","Item1","Item1","Item1","Item1"]

    var shoppingItemArray: [ShoppingItem] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBAction func addItem(_ sender: AnyObject) {
        addTextFromTextField()
        self.tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldOutlet.resignFirstResponder()
        addTextFromTextField()
        return true
    }
    
    func addTextFromTextField() {
        let theTextFieldText = textFieldOutlet.text
        let newitem = ShoppingItem.init(name: theTextFieldText!, price: 7)
        shoppingItemArray.insert(newitem, at: 0)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textFieldOutlet.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.setEditing(true, animated: true)
        getTheDataFromShoppingService()
    }
    
    func getTheDataFromShoppingService() {
        //Get the Json Dictionary
        let JSONDictionary = ShoppingItemService.getData() as NSDictionary
        
        //Get the array of dictionaries use Key "ShoppingItems"
        let arrayOfDictionaries = JSONDictionary["ShoppingItems"] as! NSArray
        
        //Iterate the array
        for shoppingItemDictionary in arrayOfDictionaries {
            //Cast the item to a dictionary
            var shoppingItem = shoppingItemDictionary as! Dictionary<String, Any>
            
            //name string from dictinoary
            let nameOfItem = shoppingItem["name"] as! String
            
            //price integer
            let priceOfItem = shoppingItem["price"] as! Int
            
            //store dictionary item to our object
            let currentShoppingItem = ShoppingItem.init(name: nameOfItem, price: priceOfItem)
            
            //add our shopping item array to our array of Shopping Items
            shoppingItemArray.append(currentShoppingItem)
        }
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
        return shoppingItemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let currentShoppingItem = shoppingItemArray[indexPath.row]
        
        cell.detailTextLabel?.text = currentShoppingItem.name //shoppingList[indexPath.row]
        
        cell.textLabel?.text = String(currentShoppingItem.price)//"Row \(indexPath.row)"
        
//        cell.imageView?.image = #imageLiteral(resourceName: "Screen1")
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            shoppingItemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
