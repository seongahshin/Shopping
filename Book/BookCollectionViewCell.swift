//
//  BookCollectionViewCell.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/20.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookRate: UILabel!
    
    func configureCell(data: BookStruct) {
        bookTitle.text = data.title
        bookRate.text = "\(data.rate)"
        
    }
}
