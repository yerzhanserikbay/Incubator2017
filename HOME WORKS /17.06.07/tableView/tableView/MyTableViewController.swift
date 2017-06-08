//
//  MyTableViewController.swift
//  tableView
//
//  Created by YERZHAN SERIKBAY on 6/8/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

var pets = ["dog", "cat", "rabbit"]
var petDesc = ["Dog is an animal that has four legs", "A cat is an animal that likes to eat fish", "A rabbit is an animal that likes to jump around"]

class MyTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = pets[indexPath.row]
        
        return cell
    }


}
