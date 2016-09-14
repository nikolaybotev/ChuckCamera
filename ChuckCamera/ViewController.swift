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
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let alertView = UIAlertView(
                title: "Error", message: "No camera", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func takePhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .camera

        //picker.showsCameraControls = false
        let overlay = OverlayView(frame: CGRect(x: 0, y: 0, width: CGFloat(kScreenWidth), height: CGFloat(kScreenHeight)))
        picker.cameraOverlayView = overlay

        picker.cameraViewTransform = picker.cameraViewTransform.scaledBy(x: CGFloat(kCameraTransformX),
                                                            y: CGFloat(kCameraTransformY))

        self.present(picker, animated: true, completion: nil)
    }

    @IBAction func selectPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary

        self.present(picker, animated: true, completion: nil)
    }
}

