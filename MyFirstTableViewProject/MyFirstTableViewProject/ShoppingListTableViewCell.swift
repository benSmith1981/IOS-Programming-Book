//
//  ShoppingListTableViewCell.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 23/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingListImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataForTableCell(shoppingListItem: ShoppingItem) {
        self.titleLabel?.text = shoppingListItem.name
        self.shoppingListImageView.image = UIImage.init(named: "Screen1")
        self.detailTextView.text = "Price: \(shoppingListItem.price)"
    }
    
}
