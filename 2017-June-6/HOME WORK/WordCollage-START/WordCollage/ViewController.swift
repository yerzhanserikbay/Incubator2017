/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func whiteBotton(_ sender: Any) {
         self.view.backgroundColor = UIColor.white
    }
   

    @IBAction func blackBotton(_ sender: Any) {
        self.view.backgroundColor = UIColor.black
    }
    
    
    @IBAction func redBotton(_ sender: Any) {
         self.view.backgroundColor = UIColor.red
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

