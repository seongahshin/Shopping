//
//  ShoppingTableViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/19.
//

import UIKit
import RealmSwift
import Kingfisher

class ShoppingTableViewController: UITableViewController {
    
    let localRealm = try! Realm()
    
    var shoppingList: [ShoppingModel] = []
    
    var list = ["사과", "바나나", "키위", "망고"]
    
    var tasks: Results<ShoppingModel>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var menuItems: [UIAction] = {
        return [
            UIAction(title: "할 일 완료순", image: UIImage(systemName: "arrow.down.circle"), handler: { _ in
                self.tasks = self.localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "didList", ascending: false)
            }),
            UIAction(title: "즐겨찾기순", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in
                self.tasks = self.localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "favoriteList", ascending: false)
            }),
        ]
    }()
    
    lazy var menu: UIMenu = {
        return UIMenu(title: "", options: [], children: menuItems)
    }()
    
    @IBOutlet weak var SearchTextField: UITextField!
    
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var ShoppingTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
        tableView.rowHeight = 50
        tasks = localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "buyList", ascending: false)
        print(tasks)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        tasks = localRealm.objects(ShoppingModel.self)
        
        if #available(iOS 14.0, *) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), menu: menu)
        }
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        let row = tasks[indexPath.row]
        cell.titleLabel.text = row.buyList
        cell.titleLabel.font = .boldSystemFont(ofSize: 18)
        cell.titleLabel.textAlignment = .center
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(favoriteButtonClicked(_:)), for: .touchUpInside)
        
        row.didList ? cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal) : cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        row.favoriteList ? cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal) : cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        
        
        return cell
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {

        let updatetasks = tasks[sender.tag]
        print(sender.tag)
        
        try! localRealm.write {
            updatetasks.didList = !updatetasks.didList
        }
        tableView.reloadData()
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        
        let updatetasks = tasks[sender.tag]
        
        try! localRealm.write {
            updatetasks.favoriteList = !updatetasks.favoriteList
        }
        tableView.reloadData()
    }
    
    
    @IBAction func TextFieldReturn(_ sender: UITextField) {
        list.append(sender.text!)
        tableView.reloadData()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        if let todoList = SearchTextField.text {
            shoppingList.append(ShoppingModel(buyList: todoList))
            let task = ShoppingModel(buyList: todoList)
            
            try! localRealm.write {
                localRealm.add(task)
                print(task)
            }
            tasks = localRealm.objects(ShoppingModel.self)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "삭제") { [self] action, view, completionHandler in
            completionHandler(true)
            try! self.localRealm.write {
                self.localRealm.delete(self.tasks[indexPath.row])
                tableView.reloadData()
            }
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete])
        return config
    }
        
        
    
    
}

