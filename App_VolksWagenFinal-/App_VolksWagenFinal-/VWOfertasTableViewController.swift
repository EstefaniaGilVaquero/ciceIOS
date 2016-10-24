//
//  VWOfertasTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWOfertasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var arrayOfertas = [VWOfertasModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshTVC.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView, endRefreshTVC: refreshTVC)), forControlEvents: .EditingDidEnd)
        tableView.addSubview(refreshTVC)
        
        //Aqui alimentamos nuestro array
        arrayOfertas =  VWAPIManager.sharedInstance.getOfertasParse()
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
        return arrayOfertas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VWOfertasCustomCell
        
        let ofertasData = arrayOfertas[indexPath.row]
        
        cell.myMasInformacionLBL.text = ofertasData.descripcion
        cell.myFechaFin.text = ofertasData.fechaFin!
        cell.myImagenOferta.kf_setImageWithURL(NSURL(string: getImagePath(ofertasData.imagen!)))
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleOfertaVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleOfertaFinal") as! VWDetalleOfertasViewController
        detalleOfertaVC.arrayOfertasData = arrayOfertas[indexPath.row]
        navigationController?.pushViewController(detalleOfertaVC, animated: true)
    }
    

    
}
