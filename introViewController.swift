//
//  introViewController.swift
//  imageSlider
//
//  Created by Brian Shih on 9/1/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit

class introViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
    }
    
    @IBAction func button(_ sender: AnyObject) {
        performSegue(withIdentifier: "toPuzzle", sender: self)

    }
    var imagePuzzle: UIImage?
    
    @IBAction func choosePhoto(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture, otherwise,
        // just pick from photo library
//        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
//            imagePicker.sourceType = .Camera
//        }
//        else {
            imagePicker.sourceType = .camera
//        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func choosePhoto2(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture, otherwise,
        // just pick from photo library
        //        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
        //            imagePicker.sourceType = .Camera
        //        }
        //        else {
        imagePicker.sourceType = .photoLibrary
        //        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        // Place image picker on the screen
        present(imagePicker, animated: true) {
            () in
         
        }
            
        print("hi")
    }
    
//    func imagePickerController(picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [String: AnyObject]) {
//        
//        // Get picked image from info dictionary
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        
//        imagePuzzle = image
//        dismissViewControllerAnimated(true, completion: nil)
////        performSegueWithIdentifier("toPuzzle", sender: self)
//    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("photo library")
        
        // Crop the picked image to square
        let imagePicked = info[UIImagePickerControllerEditedImage] as! UIImage
        let imageWidth  = imagePicked.size.width
        let imageHeight  = imagePicked.size.height
        var rect = CGRect()
        if (imageWidth < imageHeight) { // Image is in potrait mode
            rect = CGRect (x: 0, y: (imageHeight - imageWidth) / 2, width: imageWidth, height: imageWidth);
        } else { // Image is in landscape mode
            rect = CGRect (x: (imageWidth - imageHeight) / 2, y: 0, width: imageHeight, height: imageHeight);
        }
        let croppedCGImage = imagePicked.cgImage?.cropping(to: rect)
        let croppedUIImage = UIImage(cgImage: croppedCGImage!)
        
        // Update currentImagePackage
               self.imagePuzzle = croppedUIImage
        // Dismiss picker
        picker.dismiss(animated: true) {
            () in
               self.performSegue(withIdentifier: "toSelection", sender: self)
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPuzzle" {
            if let destinationVC = segue.destination as? puzzleViewController {
                destinationVC.imageToPassOn = self.imagePuzzle!

            }
        }
        
        if segue.identifier == "toSelection" {
            if let destinationVC = segue.destination as? choosePuzzleType {
                destinationVC.imageStore = self.imagePuzzle!
            }
        }
    }
    
    
    

}
