//
//  settingsViewController.swift
//  imageSlider
//
//  Created by Brian Shih on 10/2/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    
//    let defaults = UserDefaults.standard
//    defaults.setObject(1, forKey: "userNameKey")
    
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    

    @IBAction func firstUp(_ sender: AnyObject) {
        firstNumber += 1
        firstLabel.text = "\(firstNumber)"
    }
    
    
    @IBAction func secondUp(_ sender: AnyObject) {
        secondNumber += 1
        secondLabel.text = "\(secondNumber)"
    }
    
    
    
    @IBAction func firstDown(_ sender: AnyObject) {
        firstNumber -= 1
        firstLabel.text = "\(firstNumber)"

    }
    
    @IBAction func secondDown(_ sender: AnyObject) {
        secondNumber -= 1
        secondLabel.text = "\(secondNumber)"

    }
    
    var firstNumber = 6
    var secondNumber = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
