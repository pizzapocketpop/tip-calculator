//
//  ViewController.swift
//  Tips
//
//  Created by Stephanie Parrott on 2015-05-26.
//  Copyright (c) 2015 Stephanie Parrott. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twopeopleLabel: UILabel!
    @IBOutlet weak var threepeopleLabel: UILabel!
    @IBOutlet weak var fourpeopleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twopeopleLabel.text = "$0.00"
        threepeopleLabel.text = "$0.00"
        fourpeopleLabel.text = "$0.00"

        
        // 1
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 2
        gradientLayer.frame = self.view.bounds
        
        // 3
        let color1 = UIColor(red: 82.0/255.0, green: 112.0/255.0, blue: 209.0/255.0, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 62.0/255.0, green: 25.0/255.0, blue: 120.0/255.0, alpha: 1.0).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2]
        
        // 4
        gradientLayer.locations = [0.0, 1.0]
        
        // 5
        view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var twopeople = total/2
        var threepeople = total/3
        var fourpeople = total/4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twopeopleLabel.text = String(format: "$%.2f", twopeople)
        threepeopleLabel.text = String(format: "$%.2f", threepeople)
        fourpeopleLabel.text = String(format: "$%.2f", fourpeople)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}