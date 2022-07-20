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
        // 타이틀
        bookTitle.font = .boldSystemFont(ofSize: 20)
        bookTitle.textColor = .white
        bookTitle.text = data.title
        
        // 평점
        bookRate.font = .systemFont(ofSize: 15)
        bookRate.textColor = .white
        bookRate.text = "\(data.rate)"
        bookRate.textAlignment = .center
    }
    
    
        
}
