//
//  ICOListaTareasTableViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 4/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

//MARK: - VARIABLES EXTERNAS
var myListaTareas = [String]()
var myListaFechaTareas = [String]()
var myListaDescripcionTareas = [String]()
var myListaPrioridadTareas = [String]()
var myListaCategoriatareas = [String]()
var myListaFotostareas = [NSData]()

class ICOListaTareasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var CONSTANTES = Constantes()
    let prefs = NSUserDefaults.standardUserDefaults()
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: - Aqui cargamos nuestros datos salvados previamente en el NSUserdefaults
        myListaTareas = prefs.objectForKey(CONSTANTES.LISTA_TAREA_KEY) as! [String]
        myListaPrioridadTareas = prefs.objectForKey(CONSTANTES.LISTA_PRIORIDAD_KEY) as! [String]
        myListaFechaTareas = prefs.objectForKey(CONSTANTES.LISTA_FECHA_KEY) as! [String]
        myListaDescripcionTareas = prefs.objectForKey(CONSTANTES.LISTA_DESCRIPCION_KEY) as! [String]
        myListaCategoriatareas = prefs.objectForKey(CONSTANTES.LISTA_CATEGORIA_KEY) as! [String]
        myListaFotostareas = prefs.objectForKey(CONSTANTES.LISTA_FOTO_KEY) as! [NSData]
        
        self.title = "Lista Tareas"
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
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
        
        return myListaTareas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ICOCustomCell

        // Configure the cell...
        
        let imageData = UIImage(data: myListaFotostareas[indexPath.row])!
        
        cell.myTareaLBL.text = myListaTareas[indexPath.row]
        cell.myPrioridadTarea.text = myListaPrioridadTareas[indexPath.row]
        cell.myDescripcionTareaLBL.text = myListaDescripcionTareas[indexPath.row]
        cell.myFechaTareaLBL.text = myListaFechaTareas[indexPath.row]
        cell.myCategoriaLBL.text = myListaCategoriatareas[indexPath.row]
        cell.myImageIV.image = imageData

        return cell
    }
   

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let item = myListaTareas[fromIndexPath.row]
        myListaTareas.removeAtIndex(fromIndexPath.row)
        myListaTareas.insert(item, atIndex: toIndexPath.row)
        
        tableView.reloadData()
        

    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //1
        let shareAction = UITableViewRowAction(style: .Default, title: "Share") { (action, indexPath) in
            //2
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.lightGrayColor()
        
        
        //1
        let rateAction = UITableViewRowAction(style: .Default, title: "Rate") { Void in
            //2
            let rateMenu = UIAlertController(title: nil, message: "Rate de App", preferredStyle: .ActionSheet)
            let rateAction = UIAlertAction(title: "Rate", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            rateMenu.addAction(rateAction)
            rateMenu.addAction(cancelAction)
            
            self.presentViewController(rateMenu, animated: true, completion: nil)
        }
        
        rateAction.backgroundColor = UIColor.blueColor()
        
        
        //1
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete") { Void in
            //2
            let DeleteMenu = UIAlertController(title: nil, message: "Delete", preferredStyle: .ActionSheet)
            let DeleteAction = UIAlertAction(title: "Delete", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            DeleteMenu.addAction(DeleteAction)
            DeleteMenu.addAction(cancelAction)
            
            self.presentViewController(DeleteMenu, animated: true, completion: nil)
        }
        
        rateAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction, shareAction, rateAction]

    }
    
    // Override to support editing the table view.
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        if editingStyle == .Delete {
    //
    //            myListaTareas.removeAtIndex(indexPath.row)
    //            prefs.setObject(myListaTareas, forKey: CONSTANTES.LISTA_TAREA_KEY)
    //
    //            tableView.reloadData()
    //
    //        }
    //    }

    

    
 
    

    
}
