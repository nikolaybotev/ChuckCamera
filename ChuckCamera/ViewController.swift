//
//  ViewController.swift
//  ChuckCamera
//
//  Created by Nikolay Botev on 4/2/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .Camera

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

