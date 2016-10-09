//
//  puzzleViewController.swift
//  imageSlider
//
//  Created by Brian Shih on 8/30/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit

class puzzleViewController: UIViewController, tileViewDelegate {
    var imageToPassOn: UIImage!
    var numberOfMoves = 0
    @IBOutlet weak var movesLabel: UILabel!
    
    func didTileShift() {
        numberOfMoves += 1;
        
        movesLabel.text = "\(numberOfMoves)"
    }
    
    func gameEnded() {
        performSegue(withIdentifier: "finish", sender: self)
    }
    @IBOutlet weak var board: TileAreaView!
    
    
    override func viewDidLoad() {
       board.delegate = self
        print("1")
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finish" {
            if let destinationVC = segue.destination as? finalViewController {
                destinationVC.moveer = numberOfMoves
            }
        }
    }
    
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        board.imageToSolve = self.imageToPassOn
        board.initialize()
        board.shuffleTiles()
        }

    
    
    
}
