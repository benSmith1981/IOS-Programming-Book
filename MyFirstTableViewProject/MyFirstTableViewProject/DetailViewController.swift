//
//  DetailViewController.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 24/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var theItem: ShoppingItems?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = theItem?.name
        self.priceLabel.text = "Price: \(theItem?.price)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
