//
//  ViewController.swift
//  AppTableViewEjercicio
//
//  Created by cice on 8/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    let myArray = ["Hola", "Adios"]
    
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myTableViewCustom: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableViewCustom.delegate = self
        myTableViewCustom.dataSource = self
        
        myTableViewCustom.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - EXTENSION 

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 250000
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = myTableViewCustom.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = "Estefania"
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

