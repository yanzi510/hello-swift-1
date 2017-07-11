//
//  ViewController.swift
//  06_alert
//
//  Created by NAVER on 2017. 7. 11..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lampOn : UIImage = UIImage(named: "lamp-on.png")!
    let lampOff : UIImage = UIImage(named: "lamp-off.png")!
    let lampRemove : UIImage = UIImage(named: "lamp-remove.png")!
    var isLampOn = true
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

    
    @IBAction func turnOn(_ sender: UIButton) {
        if ( isLampOn == true ) {
            let lampOnAlert = UIAlertController(
                title: "경고",
                message: "현재 On 상태입니다",
                preferredStyle: UIAlertControllerStyle.alert
            )
            let onAction = UIAlertAction(
                title: "네, 알겠습니다",
                style: UIAlertActionStyle.default,
                handler: nil
            )
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            imageView.image = lampOn
            isLampOn = true
        }
    }

    @IBAction func turnOff(_ sender: UIButton) {
        if ( isLampOn ) {
            let lampOffAlert = UIAlertController(
                title: "램프 끄기",
                message: "램프를 끄시겠습니까?",
                preferredStyle: UIAlertControllerStyle.alert
            )
            let offAction = UIAlertAction(
                title: "네",
                style: UIAlertActionStyle.default,
                handler: {
                    ACTION in self.imageView.image = self.lampOff
                    self.isLampOn = false
                }
            )
            let cancelAction = UIAlertAction(
                title: "아니오",
                style: UIAlertActionStyle.default,
                handler: nil
            )
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func destroyIt(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(
            title: "램프 제거",
            message: "램프를 제거하시겠습니까?",
            preferredStyle: UIAlertControllerStyle.alert
        )
        let offAction = UIAlertAction(
            title: "아니오, 끕니다",
            style: UIAlertActionStyle.default,
            handler: {
                ACTION in self.imageView.image = self.lampOff
                self.isLampOn = false
            }
        )
        let onAction = UIAlertAction(
            title: "아니오, 켭니다",
            style: UIAlertActionStyle.default,
            handler: {
                ACTION in self.imageView.image = self.lampOn
                self.isLampOn = true
            }
        )
        let removeAction = UIAlertAction(
            title: "네, 제거합니다",
            style: UIAlertActionStyle.destructive,
            handler: {
                ACTION in self.imageView.image = self.lampRemove
                self.isLampOn = false
            }
        )
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

