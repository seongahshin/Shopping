//
//  ShoppingTableViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    var list = ["사과", "바나나", "키위", "망고"]
    @IBOutlet weak var SearchTextField: UITextField!
    
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var ShoppingTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
        tableView.rowHeight = 50
    }

    func viewDesign() {
        // 타이틀
        ShoppingTitle.text = "쇼핑"
        ShoppingTitle.textAlignment = .center
        ShoppingTitle.font = .boldSystemFont(ofSize: 20)
        ShoppingTitle.textColor = .black
        
        // 텍스트필드
        SearchTextField.placeholder = "무엇을 구매하시겠습니까?"
        
        
        // 버튼
        SearchButton.setTitle("추가", for: .normal)
        SearchButton.setTitleColor(.black, for: .normal)
        SearchButton.layer.cornerRadius = 5
        SearchButton.backgroundColor = .lightGray
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.titleLabel.text = list[indexPath.row]
        cell.titleLabel.font = .boldSystemFont(ofSize: 18)
        cell.titleLabel.textAlignment = .center
        return cell
    }
    
    @IBAction func TextFieldReturn(_ sender: UITextField) {
        list.append(sender.text!)
        tableView.reloadData()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        list.append(SearchTextField.text!)
        tableView.reloadData()
    }
    
}

