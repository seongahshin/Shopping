//
//  BookViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/21.
//

import UIKit

class BookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Book", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
