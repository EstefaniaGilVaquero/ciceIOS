//
//  DPListaContratosViewController.swift
//  AppCoreData_GDP
//
//  Created by cice on 19/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData

class DPListaContratosViewController: UITableViewController {
    
    //MARK: VARIABLES LOCALES GLOBALES
    var customManageObjectContext : NSManagedObjectContext?
    var fetchArrayContratos = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //1. establecemos la conexion con sqlite a traves del contextManager
        let customAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        customManageObjectContext = customAppDelegate.managedObjectContext
        fetchArrayContratos = customAppDelegate.getAllDataContratos()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchArrayContratos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let contrato : Contratos = fetchArrayContratos[indexPath.row] as! Contratos
        
<<<<<<< HEAD
        cell.textLabel?.text = NSString(format: "Nombre Cliente: %@ / Empresa: %@", contrato.nombreYApellido!, contrato.nombreEmpresa!) as String
        cell.detailTextLabel?.text = NSString(format: "Fecha: %@ de %@ - 2016", contrato.numeroFecha!, contrato.mesFecha!) as String
=======
        cell.textLabel?.text = contrato.nombreYApellido
        cell.detailTextLabel?.text = contrato.nombreEmpresa
>>>>>>> d39033a7b7647a3042833eeddd49130ca112dfbc
        
        return cell
    }
    
<<<<<<< HEAD
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetalleContrato") as! DPDetalleContratoViewController
        
        detalleVC.contratoSeleccionado = fetchArrayContratos[indexPath.row] as! Contratos
        self.navigationController?.pushViewController(detalleVC, animated: true)
    }
    
=======
>>>>>>> d39033a7b7647a3042833eeddd49130ca112dfbc

}
