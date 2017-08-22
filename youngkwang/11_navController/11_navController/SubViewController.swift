//
//  SubViewController.swift
//  11_navController
//
//  Created by ChoYoungKwang on 2017. 8. 7..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: SubViewController, message: String)
    func didImageOnOffDone(_ controller: SubViewController, isOn: Bool)
}

class SubViewController: UIViewController {
    
    var incomeText: String = "유입 경로가 나타납니다."
    var incomeMessage: String = ""
    var isOn = false
    var delegate: EditDelegate?

    @IBOutlet weak var textMsg: UITextField!
    @IBOutlet weak var labelInCome: UILabel!
    @IBOutlet weak var lampSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelInCome.text = incomeText
        textMsg.text = incomeMessage
        lampSwitch.isOn = isOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonComplete(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: textMsg.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
}
