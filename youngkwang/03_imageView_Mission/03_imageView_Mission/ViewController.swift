//
//  ViewController.swift
//  03_imageView_Mission
//
//  Created by ChoYoungKwang on 2017. 6. 23..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageName = ["image1.jpg","image2.jpg","image3.jpg","image4.jpg"]
    var currentImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentImage = UIImage(named: "images/" + imageName[0])
        imageView.image = currentImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

