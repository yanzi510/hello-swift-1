//
//  ViewController.swift
//  09_pageControl
//
//  Created by ChoYoungKwang on 2017. 8. 1..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

var imageArr = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg"]

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.numberOfPages = imageArr.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        
        imageView.image = UIImage(named: imageArr[pageControl.currentPage])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        imageView.image = UIImage(named: imageArr[pageControl.currentPage])
    }

}

