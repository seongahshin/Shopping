//
//  ShoppingTableViewCell.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/19.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    var checked: Bool = true
    var favorite: Bool = true

    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        
        if checked {
            checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checked = !checked
            print(checked)
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checked = !checked
            print(checked)
        }
    }
    
    
}
