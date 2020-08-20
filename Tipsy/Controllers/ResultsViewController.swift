//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jesus Lopez on 8/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total = "0.0"
    var split = "2"
    var tip = "0%"

    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var splitTipText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPerPerson.text = total
        splitTipText.text = "Split between \(split) people, with \(tip)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
