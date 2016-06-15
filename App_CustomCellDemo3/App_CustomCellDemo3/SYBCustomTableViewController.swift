//
//  SYBCustomTableViewController.swift
//  App_CustomCellDemo3
//
//  Created by cice on 15/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBCustomTableViewController: UITableViewController {

    //MARK: VARIABLES LOCALES GLOBALES
    
    var posteosArray = []
    var posteosDiccionario = [:]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //lista que alimenta nuestro array
        let path = NSBundle.mainBundle().pathForResource("Contactos", ofType: "plist")
        posteosArray = NSArray(contentsOfFile: path!)!
        
        //Aqui colocamos el titulo a traves de codigo si queremos
        self.title = "Mis contactos"
        
        //Aqui colocaml boton en la barra de navegacion
        let customButtonNVC = UIButton(type: .Custom)
        customButtonNVC.setImage(UIImage(named: "estefi.jpg"), forState: .Normal)
        customButtonNVC.frame = CGRectMake(0, 0, 35, 35)
        customButtonNVC.layer.cornerRadius = customButtonNVC.frame.width / 2
        customButtonNVC.imageView?.contentMode = .ScaleAspectFill
        customButtonNVC.clipsToBounds = true
        
        customButtonNVC.addTarget(self, action: #selector(SYBCustomTableViewController.showAlertVC), forControlEvents: .TouchUpInside)
        
        let barButtonNC = UIBarButtonItem(customView: customButtonNVC)
        navigationItem.rightBarButtonItem = barButtonNC
        
        
    }
    
    func showAlertVC(){
        /*let alertVC = UIAlertController(title: "Hey", message: "hola hola", preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)*/
        
        posteosDiccionario = posteosArray.lastObject as! NSDictionary
        
        let nombre = posteosDiccionario["nombre"] as! String
        let apellido = posteosDiccionario["apellido"] as! String
        let twitter = posteosDiccionario["twitter"] as! String
        let fecha = posteosDiccionario["fecha"] as! String
        let experiencia = posteosDiccionario["experiencia"] as! String
        let seguidores = posteosDiccionario["seguidores"] as! String
        let descripcion = posteosDiccionario["descripcion"] as! String
        
        let imageProfile = posteosDiccionario["imageProfile"] as! String
        
        let imageProfileCustom = UIImage(named: imageProfile)
        
       let ventanaVC2 = self.storyboard?.instantiateViewControllerWithIdentifier("ventanaVC2") as! SYBDetalleViewController
        
        ventanaVC2.nombreData = nombre
        ventanaVC2.apellidoData = apellido
        ventanaVC2.twitterData = twitter
        ventanaVC2.fechaData = fecha
        ventanaVC2.experienciaData = experiencia
        ventanaVC2.seguidoresData = seguidores
        ventanaVC2.descripcionData = descripcion
        ventanaVC2.imageProfileData = imageProfileCustom
        
        
        navigationController?.pushViewController(ventanaVC2, animated: true)
        //presentViewController(ventanaVC2, animated: true, completion: nil)
        
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
        return posteosArray.count-1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SYBCustomCell

        // Configure the cell...
        
        posteosDiccionario = posteosArray.objectAtIndex(indexPath.row) as! NSDictionary
        
        let nombre = posteosDiccionario["nombre"] as! String
        let apellido = posteosDiccionario["apellido"] as! String
        let twitter = posteosDiccionario["twitter"] as! String
        let fecha = posteosDiccionario["fecha"] as! String
        let imageProfile = posteosDiccionario["imageProfile"] as! String
        
        let imageProfileCustom = UIImage(named: imageProfile)
      
        
        cell.myNombreLBL.text = nombre
        cell.myApellidoLBL.text = apellido
        cell.myTwitterLBL.text = twitter
        cell.myFechaLBL.text = fecha
        cell.myImageProfile.image = imageProfileCustom
       
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        posteosDiccionario = posteosArray.objectAtIndex(indexPath.row) as! NSDictionary
        
        let nombre = posteosDiccionario["nombre"] as! String
        let apellido = posteosDiccionario["apellido"] as! String
        let twitter = posteosDiccionario["twitter"] as! String
        let fecha = posteosDiccionario["fecha"] as! String
        let experiencia = posteosDiccionario["experiencia"] as! String
        let seguidores = posteosDiccionario["seguidores"] as! String
        let descripcion = posteosDiccionario["descripcion"] as! String
        
        let imageProfile = posteosDiccionario["imageProfile"] as! String
        
        let imageProfileCustom = UIImage(named: imageProfile)
        
        let ventanaVC2 = self.storyboard?.instantiateViewControllerWithIdentifier("ventanaVC2") as! SYBDetalleViewController
        
        ventanaVC2.nombreData = nombre
        ventanaVC2.apellidoData = apellido
        ventanaVC2.twitterData = twitter
        ventanaVC2.fechaData = fecha
        ventanaVC2.experienciaData = experiencia
        ventanaVC2.seguidoresData = seguidores
        ventanaVC2.descripcionData = descripcion
        ventanaVC2.imageProfileData = imageProfileCustom
        
        
        navigationController?.pushViewController(ventanaVC2, animated: true)

        
        
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
