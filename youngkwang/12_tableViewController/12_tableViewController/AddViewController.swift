//
//  AddViewController.swift
//  12_tableViewController
//
//  Created by ChoYoungKwang on 2017. 8. 28..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("icon-new.png")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
