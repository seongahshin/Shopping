//
//  TrendMediaTableViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/19.
//

import UIKit

class TrendMediaTableViewController: UITableViewController {
    
    var movieName = ["해리포터", "업", "탑건", "엘비스"]
    var moviePoster: [String] = ["HarryPotter.jpg", "Up.jpg", "TopGun.jpg", "Elbis.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendMediaTableViewCell") as! TrendMediaTableViewCell
        
        cell.movieTitleLabel.text = movieName[indexPath.row]
        cell.movieTitleLabel.textColor = .black
        cell.movieTitleLabel.font = .systemFont(ofSize: 10)
        
        cell.posterImageView.image = UIImage(named: moviePoster[indexPath.row])
        return cell
    }
    
    
}
