//
//  WWOfertasTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWOfertasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var arrayOfertas = [WWOfertasModel]()


    override func viewDidLoad() {
        super.viewDidLoad()

       
        refreshTVC.backgroundColor = UIColor(red: 255 / 255, green: 128 / 255, blue: 0 / 255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView,endRefreshTVC : refreshTVC)), forControlEvents: .ValueChanged)
        tableView.addSubview(refreshTVC)
        
        arrayOfertas = WWApiManager.sharedInstance.getOfertasParse()

        
        
        
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! WWOfertasTableViewCell

        let ofertasData = arrayOfertas[indexPath.row]
        
        cell.myfechafin.text = ofertasData.fechaFin
        cell.mymasinfo.text = ofertasData.descripcion
        
        
        cell.myImagen.kf_setImageWithURL(NSURL(string: getImagePath(ofertasData.imagen!)))
        
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleOfertasVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleofertafinal") as! WWOfertasViewController
        
        detalleOfertasVC.arrayOfertas = arrayOfertas[indexPath.row]
        navigationController?.pushViewController(detalleOfertasVC, animated: true)
        
        
    }
}
