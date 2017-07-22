//
//  MenuViewController.swift
//  ToDoTask
//
//  Created by YERZHAN SERIKBAY on 6/16/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var delegate: Communicable?
    
    var selectedGroup: Groups = .Undefined
    var date: String?
    var month: String?
    var day: String?
    var year: String?
    var nameOfTitle: String?
    
    var segmented = 1
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var spendsButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
 
    
    
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func shopPressedButton(_ sender: Any) {
        selectedGroup = .Shop
        self.shopButton.setImage(#imageLiteral(resourceName: "Bag-Present"), for: .normal)
        self.reminderButton.setImage(#imageLiteral(resourceName: "Bell 2"), for: .normal)
        self.spendsButton.setImage(#imageLiteral(resourceName: "Euro-Coin 2"), for: .normal)
        self.workButton.setImage(#imageLiteral(resourceName: "Mind-Map-Paper 2"), for: .normal)
    }
    @IBAction func reminderPressedButton(_ sender: Any) {
        selectedGroup = .Reminder
        self.reminderButton.setImage(#imageLiteral(resourceName: "Bell"), for: .normal)
        self.shopButton.setImage(#imageLiteral(resourceName: "Bag-Present 2"), for: .normal)
        self.spendsButton.setImage(#imageLiteral(resourceName: "Euro-Coin 2"), for: .normal)
        self.workButton.setImage(#imageLiteral(resourceName: "Mind-Map-Paper 2"), for: .normal)

    }
    @IBAction func spendsPressedButton(_ sender: Any) {
        selectedGroup = .Spends
        self.spendsButton.setImage(#imageLiteral(resourceName: "Euro-Coin"), for: .normal)
        self.shopButton.setImage(#imageLiteral(resourceName: "Bag-Present 2"), for: .normal)
        self.reminderButton.setImage(#imageLiteral(resourceName: "Bell 2"), for: .normal)
        self.workButton.setImage(#imageLiteral(resourceName: "Mind-Map-Paper 2"), for: .normal)
    }
    
    @IBAction func workPressedButton(_ sender: Any) {
        selectedGroup = .Work
        self.workButton.setImage(#imageLiteral(resourceName: "Mind-Map-Paper"), for: .normal)
        self.shopButton.setImage(#imageLiteral(resourceName: "Bag-Present 2"), for: .normal)
        self.reminderButton.setImage(#imageLiteral(resourceName: "Bell 2"), for: .normal)
        self.spendsButton.setImage(#imageLiteral(resourceName: "Euro-Coin 2"), for: .normal)
    }
    
    
    
    //datePicker
    @IBAction func datePicker(_ sender: Any) {
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        
        day = String(describing: (components.day!))
        month = String(describing: (components.month!))
        year = String(describing: (components.year!))
        date = "\(day!) - \(month!) - \(year!)"
    }
    
    @IBAction func donePresedButton(_ sender: Any) {
        delegate?.get(title: titleTextField.text, group: selectedGroup, date: date ?? "No Date")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
