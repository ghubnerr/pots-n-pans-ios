//
//  TableViewCell.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
