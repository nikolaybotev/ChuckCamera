//
//  ViewController.swift
//  ChuckCamera
//
//  Created by Nikolay Botev on 4/2/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

let kCameraTransformX = 1
let kCameraTransformY = 2//1.24299
let kScreenWidth = 320
let kScreenHeight = 480

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (!UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            let alertView = UIAlertView(
                title: "Error", message: "No camera", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = chosenImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func takePhoto(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .Camera

        //picker.showsCameraControls = false
        let overlay = OverlayView(frame: CGRectMake(0, 0, CGFloat(kScreenWidth), CGFloat(kScreenHeight)))
        picker.cameraOverlayView = overlay

        picker.cameraViewTransform = CGAffineTransformScale(picker.cameraViewTransform,
                                                            CGFloat(kCameraTransformX),
                                                            CGFloat(kCameraTransformY))

        self.presentViewController(picker, animated: true, completion: nil)
    }

    @IBAction func selectPhoto(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .PhotoLibrary

        self.presentViewController(picker, animated: true, completion: nil)
    }
}

