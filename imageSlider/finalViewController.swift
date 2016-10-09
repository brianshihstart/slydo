//
//  finalViewController.swift
//  imageSlider
//
//  Created by Brian Shih on 10/8/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit

class finalViewController: UIViewController {
    @IBOutlet weak var final: UILabel!
    var moveer = 0
    override func viewDidLoad() {
        print(moveer)
        final.text = "\(moveer)"
    }
}
