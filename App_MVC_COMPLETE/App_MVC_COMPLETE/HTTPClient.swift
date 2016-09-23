//
//  HTTPClient.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 13/7/16.
//  Copyright © 2016 cice. All rights reserved.
//


//Esto es una interface

import UIKit

class HTTPClient {

    func getRequest(url : String) -> AnyObject{
        return NSData()
    }

    func postRequest(url : String, body : String) -> AnyObject{
        return NSData()
    }
    
    func downloadImage(url : String) -> UIImage{
        let aUrl = NSURL(string: url)
        let aData = NSData(contentsOfURL: aUrl!)
        let image = UIImage(data: aData!)
        return image!
    }


}
