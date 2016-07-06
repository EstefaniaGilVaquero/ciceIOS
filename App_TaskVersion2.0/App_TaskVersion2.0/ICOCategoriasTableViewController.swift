//
//  ICOCategoriasTableViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 29/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOCategoriasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var nombreCategoriaSeleccionada = ""
    var seleccionIndexPath = NSIndexPath()
    var listadoCategorias = ["Sin Categoría", "Tienda de Apple", "Bar con los Amigos", "En la Librería", "En el Corte Inglés", "En el Mercadona", "En Casa", "En el Parque el Retiro", "Peluquería", "En el trabajo"]
 
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<listadoCategorias.count{
            if listadoCategorias[index] == nombreCategoriaSeleccionada{
                seleccionIndexPath = NSIndexPath(forRow: index, inSection: 0)
            }
        }
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
        return listadoCategorias.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        
        let nombreCategoria = listadoCategorias[indexPath.row]
        
        cell.textLabel?.text = nombreCategoria
        
        
        if nombreCategoria == nombreCategoriaSeleccionada{
            cell.accessoryType = .Checkmark
        }else{
            cell.accessoryType = .None
        }

        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row != seleccionIndexPath.row{
            
            if let nuevaSeleccionCelda = tableView.cellForRowAtIndexPath(indexPath){
                nuevaSeleccionCelda.accessoryType = .Checkmark
            }
            if let antiguaSeleccionCelda = tableView.cellForRowAtIndexPath(seleccionIndexPath){
                antiguaSeleccionCelda.accessoryType = .None
            }
            
            seleccionIndexPath = indexPath  
        }
    }
    
    //MARK: -
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "informacionPorUnwind"{
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPathForCell(cell){
                nombreCategoriaSeleccionada = listadoCategorias[indexPath.row]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
