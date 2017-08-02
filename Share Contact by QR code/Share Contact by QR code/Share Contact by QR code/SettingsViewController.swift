//
//  SettingsViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/12/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
        
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "privateSegue", sender: self)
        }
        if indexPath.row == 1 {
            self.performSegue(withIdentifier: "publicSegue", sender: self)
        }
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: "socialSegue", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "firstCustomCell")
            cell.textLabel?.text = "Private"
            return cell
        } else if indexPath.row == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "secondCustomCell")
            cell.textLabel?.text = "Public"
            return cell
        } else {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "thirdCustomCell")
            cell.textLabel?.text = "Social"
            return cell
        }
    }
}



class FirstTableCell: UITableViewCell {
    @IBOutlet weak var privateLabel: UILabel!
    
}

class SecondTableCell: UITableViewCell {
    @IBOutlet weak var publicLabel: UILabel!
}

class ThirdTableCell: UITableViewCell {
    @IBOutlet weak var socialLabel: UILabel!
}
