//
//  ViewController.swift
//  AppTableViewIntro
//
//  Created by cice on 6/6/16.
//  Copyright © 2016 L'Epic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    let myArray = ["Enero", "Febrero","Marzo", "Abril"]
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myTableViewCustom: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myTableViewCustom.delegate = self
        //myTableViewCustom.dataSource = self
        
        myTableViewCustom.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - DELEGATE / DATASOURCE TABLE VIEW


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    //Esta funcion nos define al menos 1 seccion por defecto
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Esta funcion nos define el numero de objetos que quiero
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = myTableViewCustom.dequeueReusableCellWithIdentifier("Cell")!
        
        cell.textLabel?.text = myArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Has seleccion el mes de: \(myArray[indexPath.row])")
    }
    
}



