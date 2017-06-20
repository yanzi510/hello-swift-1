//
//  ViewController.swift
//  03_imageView
//
//  Created by ChoYoungKwang on 2017. 6. 20..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = true
    var imageOn: UIImage?
    var imageOff: UIImage?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonResize: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageOn = UIImage(named: "lamp-on.png")
        imageOff = UIImage(named: "lamp-off.png")
        imageView.image = imageOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            buttonResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            buttonResize.setTitle("축소", for: .normal)
        }
        
        isZoom = !isZoom
    }

    @IBAction func toggleImage(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = imageOn
        } else {
            imageView.image = imageOff
        }
    }
}

