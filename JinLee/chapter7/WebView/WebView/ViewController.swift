//
//  ViewController.swift
//  Web
//
//  Created by NAVER on 2017. 7. 17..
//  Copyright © 2017년 Jin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var txtUrl: UITextField!
    
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.delegate = self
        loadWebPage("http://www.naver.com")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://post.naver.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.naver.com")
        
    }
    
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1> <p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://www.naver.com\">naver</a> 으로 이동.</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "HtmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}


