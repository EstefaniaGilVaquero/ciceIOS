//
//  LFListadoTableViewController.swift
//  APP_Mapas3_lugaresFaforitos
//
//  Created by cice on 7/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

//var lugaresGuardados = [[:]]
var lugaresGuardados = [Dictionary<String,String>]()
var filaActivaSeleccionada = -1

class LFListadoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lugaresGuardados.append(["calle": "CICE", "numero": "Estamos aqui", "lat": "40.436766", "long": "-3.676266"])
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        return lugaresGuardados.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        let lugaresGuardadosModel = lugaresGuardados[indexPath.row]
        
        cell.textLabel?.text = lugaresGuardadosModel["calle"]
        cell.detailTextLabel?.text = lugaresGuardadosModel["numero"]
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        filaActivaSeleccionada = indexPath.row
        return indexPath
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "muestraMapaSinClickSobreFila"{
            filaActivaSeleccionada = -1
        }
    }
    

}
