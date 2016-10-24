//
//  VWConcesionarioTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 3/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Kingfisher

class VWConcesionarioTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var arrayConcesionarios = [VWConcesionariosModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTVC.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView, endRefreshTVC: refreshTVC)), forControlEvents: .EditingDidEnd)
        tableView.addSubview(refreshTVC)
        
        //Aqui alimentamos nuestro array
        arrayConcesionarios =  VWAPIManager.sharedInstance.getConcesionarioParse()
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
        return arrayConcesionarios.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VWConcesionarioCustomCell

        let concesionarioData = arrayConcesionarios[indexPath.row]
        
        cell.myNombreConcesionario.text = concesionarioData.Nombre
        cell.myDireccionConcesionario.text = concesionarioData.Ubicacion
        cell.myWebConcesionario.text = concesionarioData.Provincia_Nombre
        cell.hacerLlamada.setTitle("\(concesionarioData.telefono!)", forState: .Normal)
        cell.hacerLlamada.tag = indexPath.row
        cell.hacerLlamada.addTarget(self, action: #selector(VWConcesionarioTableViewController.muestraTelefono(_:)), forControlEvents: .TouchUpInside)
        cell.myImagenConcesionario.kf_setImageWithURL(NSURL(string: getImagePath(concesionarioData.Imagen!)))

        return cell
    }
    
    @IBAction func muestraTelefono(sender : UIButton){
        let concesionarioData = arrayConcesionarios[sender.tag].telefono
        let url = NSURL(string: "tel://\(concesionarioData!)")
        UIApplication.sharedApplication().openURL(url!)
        print("estoy haciendo una llamada")
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detalleConcesionarioVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleConcesionarios") as! VWDetalleConcesionarioViewController
        
        detalleConcesionarioVC.arrayConcesionariosData = arrayConcesionarios[indexPath.row]
        
        navigationController?.pushViewController(detalleConcesionarioVC, animated: true)
        
    }
    
    

    
  
}
