//
//  ViewController.swift
//  ImageViewMission
//
//  Created by 1003487 on 2017. 6. 19..
//  Copyright © 2017년 yanyangTest. All rights reserved.
//

import UIKit

var numImage = 0

class ViewController: UIViewController {
    var imageName = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet weak var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = UIImage(named:imageName[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPrevImage(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage<0) {
            numImage = imageName.count-1
        }
        imgView.image = UIImage(named:imageName[numImage])
    }
    @IBAction func btnNextImage(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage>=imageName.count) {
            numImage = 0
        }
        imgView.image = UIImage(named:imageName[numImage])
    }

}

