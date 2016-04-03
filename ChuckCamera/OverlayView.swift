//
//  OverlayView.swift
//  ChuckCamera
//
//  Created by Nikolay Botev on 4/3/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

class OverlayView: UIView {

    required override init(frame: CGRect) {
        super.init(frame: frame)
        // Clear the background of the overlay
        self.opaque = false
        self.backgroundColor = UIColor.clearColor()

        // Load the image to show in the overlay
        let overlayGraphic = UIImage(named: "overlaygraphic.png")
        let overlayGraphicView = UIImageView(image: overlayGraphic)
        overlayGraphicView.frame = CGRectMake(30, 100, 260, 200)
        self.addSubview(overlayGraphicView)

        let scanButton = ScanButton(frame: CGRectMake(130, 320, 60, 30))
        scanButton.addTarget(self, action: #selector(self.scanButtonTouchUpInside), forControlEvents: .TouchUpInside)
        self.addSubview(scanButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func scanButtonTouchUpInside() {
        let scanningLabel = UILabel(frame: CGRectMake(100, 50, 120, 30))
        scanningLabel.backgroundColor = UIColor.clearColor()
        scanningLabel.font = UIFont(name: "Courier", size: 18.0)
        scanningLabel.textColor = UIColor.redColor()
        scanningLabel.text = "Scanning . . ."

        self.addSubview(scanningLabel)

        self.performSelector(#selector(clearLabel), withObject: scanningLabel, afterDelay: 2)
    }

    func clearLabel(label: UILabel) {
        label.text = ""
    }
}
