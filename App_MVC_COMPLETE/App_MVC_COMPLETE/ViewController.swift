//
//  ViewController.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    private var allAlbumesMusicales = [ICOAlbumModel]()
    private var currentAlbumMusicalData : (titulos: [String], valores : [String])?
    private var indiceAlbumActual = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        indiceAlbumActual = 0
        
        //2
        allAlbumesMusicales = ICOLibraryAPI.sharedInstance.getAlbumesMusicales()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - DELEGADO DE UITABLEVIEW
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
}
