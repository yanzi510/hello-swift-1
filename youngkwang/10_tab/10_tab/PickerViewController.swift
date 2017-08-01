//
//  ViewController.swift
//  05_pickerView
//
//  Created by choyoungkwang on 2017. 7. 6..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate {

    let imageArrCount = 10
    let pickerColumn = 1
    let pickerViewHeight:CGFloat = 80
    var imageArr = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    var imageViewArr = [UIImage?]()
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var labelImage: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< imageArrCount {
            let image = UIImage(named: imageArr[i])
            imageViewArr.append(image)
        }
        
        labelImage.text = imageArr[0]
        imageView.image = imageViewArr[0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return pickerColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight
    }
    
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return imageArr.count
    }
    
//    // pickerView에 파일명
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageArr[row]
//    }
    
    // pickerView에 뷰이미지
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageViewArr[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelImage.text = imageArr[row]
        imageView.image = imageViewArr[row]
    }
}

