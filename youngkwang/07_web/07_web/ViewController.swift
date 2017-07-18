//
//  ViewController.swift
//  07_web
//
//  Created by ChoYoungKwang on 2017. 7. 18..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var textUrl: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func loadWebView(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.delegate = self
        loadWebView("http://www.google.com/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }

    @IBAction func buttonGo(_ sender: UIButton) {
    }
    
    @IBAction func buttonGoSite1(_ sender: UIButton) {
        loadWebView("https://github.com/commool/Hello-Swift")
    }

    @IBAction func buttonGoSite2(_ sender: UIButton) {
        loadWebView("http://swift.leantra.kr/")
    }
    
    @IBAction func buttonHtml(_ sender: UIButton) {
        let htmlString = "<h1>Hello, Swift!</h1><p>We can do it! <a href=\"http://swift.leantra.kr/\">Swift 개발문서</a></p><ul><li>김홍연</li><li>이진</li><li>조영광</li><li>홍주영</li></ul>"
        
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func buttonFile(_ sender: UIButton) {
        let file = Bundle.main
        let filePath = file.path(forResource: "animate", ofType: "html")
        loadWebView(filePath!)
    }
    
    @IBAction func buttonStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func buttonRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func buttonRewind(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func buttonFoward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

