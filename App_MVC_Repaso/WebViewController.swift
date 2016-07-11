//
//  WebViewController.swift
//  App_MVC_Repaso
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var enlaceWebSite : NSURL?
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        myActivityIndicator.hidden = true
        
        let url = enlaceWebSite
        let requestURL = NSURLRequest(URL: url!)
        myWebView.loadRequest(requestURL)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - DELEGATE WEB VIEW

extension WebViewController : UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        myActivityIndicator.hidden = false
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivityIndicator.hidden = true
        myActivityIndicator.startAnimating()
    }
}