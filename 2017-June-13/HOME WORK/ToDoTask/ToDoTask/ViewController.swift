//
//  ViewController.swift
//  ToDoTask
//
//  Created by YERZHAN SERIKBAY on 6/16/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

protocol Communicable {
    func get(title: String?, group: Groups, date: String)
}

class ViewController: UIViewController, Communicable {

    var myList = ListOfToDo.fetchList() 
    
    var titleGet = ""
    var groupGet: Groups = .Undefined
    var dateGet = String()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var imageSmallVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editPressedButton(_ sender: Any) {
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    @IBAction func addPressedButton(_ sender: Any) {
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuSegue" {
            let vc = segue.destination as! MenuViewController
            vc.delegate = self
        }
    }
    
    func get(title: String?, group: Groups, date: String) {
        titleGet = title!
        groupGet = group
        dateGet =  date
        
        let c = ListOfToDo(title: title!, group: group, date: date)
        myList.append(c)
        tableView.reloadData()
    }

}





extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = self.myList[indexPath.row]
        
        cell.textLabel?.text = toDo.title

        cell.detailTextLabel?.text = toDo.date
        
        if toDo.group == .Reminder {
        cell.imageView?.image = #imageLiteral(resourceName: "Bell 2")
        } else if toDo.group == .Shop {
            cell.imageView?.image = #imageLiteral(resourceName: "Bag-Present 2")
        } else if toDo.group == .Spends {
            cell.imageView?.image = #imageLiteral(resourceName: "Euro-Coin 2")
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "Mind-Map-Paper 2")
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.myList.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = self.myList.remove(at: sourceIndexPath.row)
        self.myList.insert(moved, at: destinationIndexPath.row)
    }
}













