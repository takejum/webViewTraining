//
//  ViewController.swift
//  webViewApp
//
//  Created by Jumpei Takeshita on 2020/03/15.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController, WKNavigationDelegate {

    var webView = WKWebView()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up the realm of webpage which will be shown
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        view.addSubview(webView)
        
        //setting up the website url where you want to go.
        let url = URL(string: "https://www.google.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    //adding the function to indicator using WKNavigation delegate
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("loading started")
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("loading completed")
        indicator.stopAnimating()
    }
    
    //functions on toolBar
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
        
    }
    
    @IBAction func goBackward(_ sender: Any) {
        webView.goBack()
        
    }
    
}


