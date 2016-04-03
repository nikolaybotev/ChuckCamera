//
//  ScanButton.swift
//  ChuckCamera
//
//  Created by Nikolay Botev on 4/3/16.
//  Copyright © 2016 Chuckmoji. All rights reserved.
//

import UIKit

class ScanButton: UIControl {

    override init(frame: CGRect) {
        super.init(frame: frame)

        let buttonImage = UIImageView(frame: CGRectMake(0, 0, 60, 30))
        buttonImage.image = UIImage(named: "scanbutton.png")

        self.addTarget(self, action: #selector(self.buttonPressed), forControlEvents: .TouchUpInside)
        self.addSubview(buttonImage)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func buttonPressed() {
        // TODO
    }

}
