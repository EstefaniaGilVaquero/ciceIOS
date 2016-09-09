//
//  SYBContactosTableViewController.swift
//  APP_CompartirContacto
//
//  Created by cice on 9/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBContactosTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactosArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SYBTableViewCell
        
        // Configure the cell...
        
        
        contactosDiccionario = contactosArray.objectAtIndex(indexPath.row) as! NSDictionary
        let firstName = contactosDiccionario["firstName"] as! String
        let lastName = contactosDiccionario["lastName"] as! String
        let description = contactosDiccionario["description"] as! String
        let imageName = contactosDiccionario["imageName"] as! String
        
        let imageCustom = UIImage(named: imageName)
        
        cell.myNombreL.text = firstName
        cell.myApellidoLBL.text = lastName
        cell.myDescripcionLBL.text = description
        cell.myImageIV.image = imageCustom
        
        
        return cell
    }

    //MARK: - IBACTION
    
}
