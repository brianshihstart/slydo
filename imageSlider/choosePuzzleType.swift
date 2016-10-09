//
//  choosePuzzleType.swift
//  imageSlider
//
//  Created by Brian Shih on 10/2/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit

class choosePuzzleType: UIViewController {
    
    @IBAction func switchButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "toGame", sender: self)
        
    }
    
    
    
    var imageStore: UIImage!
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            if let destinationVC = segue.destination as? puzzleViewController {
                destinationVC.imageToPassOn = self.imageStore!
                
            }

        }
    }
    
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
