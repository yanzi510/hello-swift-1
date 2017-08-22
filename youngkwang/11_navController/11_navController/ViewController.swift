//
//  ViewController.swift
//  11_navController
//
//  Created by ChoYoungKwang on 2017. 8. 7..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let lampOn = UIImage(named: "lamp-on.png")
    let lampOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet weak var textMsg: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = lampOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let subViewController = segue.destination as! SubViewController
        
        if segue.identifier == "ModifyButton" {
            subViewController.incomeText = "수정 버튼을 클릭함"
        } else if segue.identifier == "EditBarButton" {
            subViewController.incomeText = "편집 버튼을 클릭함"
        }
        
        subViewController.incomeMessage = textMsg.text!
        subViewController.isOn = isOn
        subViewController.delegate = self
    }

    @IBAction func buttonNoSegue(_ sender: UIButton) {
        let subViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubViewID") as! SubViewController
        
        self.navigationController?.pushViewController(subViewController, animated: true)
        subViewController.incomeText = "세그웨이 없이 스토리보드 ID값으로 전환"
        
    }

    func didMessageEditDone(_ controller: SubViewController, message: String) {
        textMsg.text = message
    }
    
    func didImageOnOffDone(_ controller: SubViewController, isOn: Bool) {
        if isOn {
            imageView.image = lampOn
            self.isOn = true
        } else {
            imageView.image = lampOff
            self.isOn = false
        }
    }
}

