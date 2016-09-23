//
//  ICOContactosTableViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 27/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//  info@andresocampo.com / info@icologic.co / aocampo@icologic.co

import UIKit

class ICOContactosTableViewController: UITableViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayContactos = []
    var dictionarioContactos = [:]
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Contactos", ofType: "plist")
        arrayContactos = NSArray(contentsOfFile: path!)!
        
        self.title = "Mis Contactos"
 
    }
    
   
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //TODO: - OCULTO DE MANERA AUTOMATICA LA NAVIGATION BAR
        navigationController?.hidesBarsOnSwipe = true
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        //TODO: - OCULTO DE MANERA AUTOMATICA EL STATUS BAR
        return navigationController?.navigationBarHidden == true
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
        return arrayContactos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ICOContactosCustomCell

        // Configure the cell...
        dictionarioContactos = arrayContactos[indexPath.row] as! NSDictionary
        
        let firstName = dictionarioContactos["firstName"] as! String
        let lastName = dictionarioContactos["lastName"] as! String
        let imageProfile = dictionarioContactos["imageProfile"] as! String
        
        let imageCustom = UIImage(named: imageProfile)
        
        cell.myNombreLBL.text = firstName
        cell.myApellidoLBL.text = lastName
        cell.myImagenContactoIV.image = imageCustom
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detalleContactosVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleContactosVC") as! ICODetalleContactoViewController
        
        
        dictionarioContactos = arrayContactos[indexPath.row] as! NSDictionary
        
        detalleContactosVC.diccionarioData = dictionarioContactos
        
        self.navigationController?.pushViewController(detalleContactosVC, animated: true)
        
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
