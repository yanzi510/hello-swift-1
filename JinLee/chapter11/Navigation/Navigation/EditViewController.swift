//
//  EditViewController.swift
//  Navigation
//
//  Created by NAVER on 2017. 8. 22..
//  Copyright © 2017년 Jin Lee. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    
    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue
        txMessage.text = txtMessage
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
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
