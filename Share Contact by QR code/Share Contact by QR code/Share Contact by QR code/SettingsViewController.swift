//
//  SettingsViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/12/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import StoreKit
import EasyPeasy
import MessageUI


class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
        
    let font = UIFont.systemFont(ofSize: 18)
    let asd: [Int] = [3,2,1]
 
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = UIColor.white
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView?.backgroundColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsetsMake(40,0,0,0)
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        
        
        tabBarController?.tabBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        tabBarController?.tabBar.tintColor = UIColor.white
        
        
        let cornerRadius: CGFloat = 15
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
            ).cgPath
        
        tabBarController?.tabBar.layer.mask = maskLayer
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.performSegue(withIdentifier: "privateSegue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            self.performSegue(withIdentifier: "publicSegue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 0 && indexPath.row == 2 {
            self.performSegue(withIdentifier: "socialSegue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            sendEmail()
            tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            SKStoreReviewController.requestReview()
            tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 2 && indexPath.row == 0 {
            self.performSegue(withIdentifier: "welcomeSegue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asd[section]
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "firstCustomCell")
            cell.textLabel?.text = "Private"
            cell.detailTextLabel?.text = "You can share this profile with friends"
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "target.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "secondCustomCell")
            cell.textLabel?.text = "Public"
            cell.detailTextLabel?.text = "This profile can be set for everyone"
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "user1.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "thirdCustomCell")
            cell.textLabel?.text = "ID number"
            cell.detailTextLabel?.text = "Set here your IIN for scanning"
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "id-card.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "")
            cell.textLabel?.text = "Feedback"
            cell.detailTextLabel?.text = "Do you have any problems? Please, tell us!"
            cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "letter.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
            
        } else if indexPath.section == 1 && indexPath.row == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "")
            cell.textLabel?.text = "Rate and Review"
            cell.detailTextLabel?.text = "Do you like our app? Please, rate it!"
            cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "shopping-online.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
        } else {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "fourthCustomCell")
            cell.textLabel?.text = "Demo"
            cell.detailTextLabel?.text = "If you don't know how to use, click it!"
            cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.font = font
            
            let image : UIImage = UIImage(named: "bulb.png")!
            cell.imageView?.image = image
            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "profiles"
        } else if section == 1 {
            return "support"
        } else {
            return "help"
        }
    }
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["yerzhan.tulkubayev@mail.com"])
            mail.setSubject("Support App")
            mail.setMessageBody("<p>Send us your issue!</p>", isHTML: true)
            present(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
