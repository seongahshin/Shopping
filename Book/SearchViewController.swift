//
//  SearchViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/21.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
       
    }
    
   
    @objc
    func closeButtonClicked() {
        self.dismiss(animated: true)
    }

}
