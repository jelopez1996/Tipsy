//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitText: UILabel!
    
    var tip = 0.1
    var total = "0.0"
    var split = 2.0
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billText.endEditing(false)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tip = Double(sender.currentTitle!.trimmingCharacters(in: ["%"]))! / 100.0
    }
    @IBAction func splitChanged(_ sender: UIStepper) {
        split = Double(sender.value)
        splitText.text = String(Int(split))
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        switch billText.text {
        case "":
            return
        default :
            let result = (Double(billText.text!)! * (1.00  + tip)) / split
            total = String(format: "%.2f", result)
            self.performSegue(withIdentifier: "goToResults", sender: self)
            
        }
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let ResultsVC = segue.destination as! ResultsViewController
            ResultsVC.total = total
            ResultsVC.tip = String(format: "%.0f", tip * 100)
            ResultsVC.split = String(format: "%.0f", split)
        }
        
    }
    
    
    

}

