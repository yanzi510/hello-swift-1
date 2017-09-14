//
//  ViewController.swift
//  PinchGesture
//
//  Created by 1003487 on 2017. 9. 14..
//  Copyright © 2017년 yanyangTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector (ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

