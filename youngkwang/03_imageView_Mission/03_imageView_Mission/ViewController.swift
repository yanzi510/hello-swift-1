//
//  ViewController.swift
//  03_imageView_Mission
//
//  Created by ChoYoungKwang on 2017. 6. 23..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageName = ["images/image1.jpg","images/image2.jpg","images/image3.jpg","images/image4.jpg"]
    var currentImage: UIImage?
    var imageIndex = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentImage = UIImage(named: imageName[imageIndex])
        imageView.image = currentImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPrev(_ sender: UIButton) {
        imageIndex = imageIndex - 1
        
        if ( imageIndex < 0 ) {
            imageIndex = imageName.count - 1
        }
        
        currentImage = UIImage(named: imageName[imageIndex])
        imageView.image = currentImage
    }

    @IBAction func buttonNext(_ sender: UIButton) {
        imageIndex = imageIndex + 1
        
        if ( imageIndex > imageName.count - 1 ) {
            imageIndex = 0
        }
        
        currentImage = UIImage(named: imageName[imageIndex])
        imageView.image = currentImage
    }
}

