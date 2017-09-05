//
//  ViewController.swift
//  15_camera
//
//  Created by ChoYoungKwang on 2017. 9. 5..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let imagePicker:UIImagePickerController! = UIImagePickerController()
    var captureImage:UIImage
    var videoURL:URL!
    var flagImageSave = false
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnCaptureImage(_ sender: UIButton) {
    }
    @IBAction func btnRecordVideo(_ sender: UIButton) {
    }
    @IBAction func btnLoadImage(_ sender: UIButton) {
    }
    @IBAction func btnLoadVideo(_ sender: UIButton) {
    }
    func myAlert(){
        
    }
}

