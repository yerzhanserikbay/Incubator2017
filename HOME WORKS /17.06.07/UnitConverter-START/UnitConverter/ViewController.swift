/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var degree = ["-10", "-9", "-8", "-7", "-6", "-5", "-4", "-3", "-2", "-1", "0", "+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10"]
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self

    }

   
    @IBAction func segmentedControl(_ sender: Any) {
        selectedIndex = segmentControl.selectedSegmentIndex
    }
    
    
    // UIPickerView DataSource, Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.degree.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.degree[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedIndex == 0 {
            let initialValue = self.degree[row]
            let finalValue = Double(initialValue)! * 1.8 + 32
            display.text = String(finalValue)
        } else {
            let initialValue = self.degree[row]
            let finalValue = Double(initialValue)! / 1.8 - 32
            display.text = String(round(finalValue*10)/10)
        }

    }
}

