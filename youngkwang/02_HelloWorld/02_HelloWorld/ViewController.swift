//
//  ViewController.swift
//  02_HelloWorld
//
//  Created by ChoYoungKwang on 2017. 6. 20..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelHello: UILabel!
    @IBOutlet weak var labelName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonSend(_ sender: UIButton) {
        labelHello.text = "Hello, " + labelName.text!
    }
    
}

