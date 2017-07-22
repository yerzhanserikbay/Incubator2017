//
//  AlbumsViewController.swift
//  AppleRate
//
//  Created by YERZHAN SERIKBAY on 7/3/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//
import UIKit

class AlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //  @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var feedList: [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Feed.fetchFeed(category: .albums) { [unowned self] (feeds, error) in
            guard let feedList = feeds else { return }
            self.feedList = feedList
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        let feed = feedList[indexPath.row]
        
        cell.textLabel?.text = feed.title
        cell.textLabel?.numberOfLines = 0
        cell.TitleLabel?.text = feed.name
        cell.SubtitleLabel?.text = feed.artist
        
        
        if let imageLink = feed.imageLink {
            let url = URL(string: imageLink)
            cell.imageView?.kf.setImage(with: url)
        }
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
