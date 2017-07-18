//
//  ViewController.swift
//  WebMission
//
//  Created by 1003487 on 2017. 7. 18..
//  Copyright © 2017년 yanyangTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.loadRequest(myRequest)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

