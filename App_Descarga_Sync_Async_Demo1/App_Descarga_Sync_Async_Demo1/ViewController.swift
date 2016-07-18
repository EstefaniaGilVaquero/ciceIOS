//
//  ViewController.swift
//  App_Descarga_Sync_Async_Demo1
//
//  Created by cice on 18/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageViewIV: UIImageView!
    @IBOutlet weak var myActivityIndicatorAI: UIActivityIndicatorView!
    
    
    
    
    @IBAction func syncMethodDownload(sender: AnyObject) {
        
        let url = NSURL(string: "Http://alertaonline.com/wp-content/uploads/obama-6.jpg")
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        myImageViewIV.image = image
        
        myActivityIndicatorAI.hidden = false
        myActivityIndicatorAI.stopAnimating()
        
        
    }
    @IBAction func asyncMethodDownload(sender: AnyObject) {
        
        let queue = dispatch_queue_create("downloadsSecondPriority", nil)
        let url = NSURL(string: "http://www.wnd.com/files/2012/10/OBAMA-RING-wh-photo-THERE-IS-NO-GOD-EXCEPT-ALLAH1.jpg")
        
        self.myActivityIndicatorAI.hidden = false
        self.myActivityIndicatorAI.stopAnimating()
        
        //creamos la cola en segundo plano
        dispatch_async(queue){
            
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            
            //Cola principal
            dispatch_async(dispatch_get_main_queue(), { 
                self.myImageViewIV.image = image
                
                self.myActivityIndicatorAI.hidden = true
                self.myActivityIndicatorAI.stopAnimating()
                
            })
            
            
        }
        
    }
    
    @IBAction func asyncPlusMethodDownload(sender: AnyObject) {
        
        
        
        fotoObama { (image) in
            self.myImageViewIV.image = image
        }
    }
    
    typealias imageClosure = (image: UIImage) -> ()
    
    func fotoObama(callBack : imageClosure){
        
        dispatch_async(dispatch_get_global_queue(0, 0)){
            let url = NSURL(string: "http://www.dogguie.net/wp-content/uploads/2011/01/obama-comun-15.jpg")
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            dispatch_async(dispatch_get_main_queue(), {
                callBack(image: image!)
            })
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicatorAI.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

