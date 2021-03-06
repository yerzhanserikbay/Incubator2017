//
//  myIDGenerator.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/31/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import EasyPeasy
import Eureka
import CoreData

class myIDGenerator: FormViewController {
    
    var number: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isStatusBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.backgroundColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsetsMake(-35,0,0,0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.tableView.alwaysBounceVertical = false

        
        navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = false
        
        getUser()
        form +++ Section()
        <<< TextRow() {
            $0.tag = "number"
            $0.title = "Write your IIN:"
            $0.placeholder = "Number"
            $0.value = self.number
            $0.cell.textField.keyboardType = .decimalPad
            $0.cell.textField.clearButtonMode = .always
        }
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        var dict = form.values(includeHidden:  true)
        
        let number = dict["number"] as? String ?? "none"
        storeUser(number: "\(number)")
        
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storeUser (number: String) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ID", in: context)
        let user = NSManagedObject(entity: entity!, insertInto: context)
        user.setValue(number, forKey: "id")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func getUser() {
        let fetchRequest: NSFetchRequest<ID> = ID.fetchRequest()
        
        do {
            let array_users = try getContext().fetch(fetchRequest)
            
            for user in array_users as [NSManagedObject] {
            
                number = user.value(forKey: "id") as? String
                
            }
        } catch {
            print("Error with request:  \(error)")
        }
    }
    
}
