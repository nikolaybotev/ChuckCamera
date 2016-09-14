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
        self.isOpaque = false
        self.backgroundColor = UIColor.clear

        // Load the image to show in the overlay
        let overlayGraphic = UIImage(named: "overlaygraphic.png")
        let overlayGraphicView = UIImageView(image: overlayGraphic)
        overlayGraphicView.frame = CGRect(x: 30, y: 100, width: 260, height: 200)
        self.addSubview(overlayGraphicView)

        let scanButton = ScanButton(frame: CGRect(x: 130, y: 320, width: 60, height: 30))
        scanButton.addTarget(self, action: #selector(self.scanButtonTouchUpInside), for: .touchUpInside)
        self.addSubview(scanButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func scanButtonTouchUpInside() {
        let scanningLabel = UILabel(frame: CGRect(x: 100, y: 50, width: 120, height: 30))
        scanningLabel.backgroundColor = UIColor.clear
        scanningLabel.font = UIFont(name: "Courier", size: 18.0)
        scanningLabel.textColor = UIColor.red
        scanningLabel.text = "Scanning . . ."

        self.addSubview(scanningLabel)

        self.perform(#selector(clearLabel), with: scanningLabel, afterDelay: 2)
    }

    func clearLabel(_ label: UILabel) {
        label.text = ""
    }
}
