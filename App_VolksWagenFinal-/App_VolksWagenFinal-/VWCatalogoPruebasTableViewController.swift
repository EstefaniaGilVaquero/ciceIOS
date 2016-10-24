//
//  VWCatalogoPruebasTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Kingfisher

class VWCatalogoPruebasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var arrayCatalogoPruebas = [VWCatalogoPruebasModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshTVC.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView, endRefreshTVC: refreshTVC)), forControlEvents: .EditingDidEnd)
        tableView.addSubview(refreshTVC)
        
        //Aqui alimentamos nuestro array
        arrayCatalogoPruebas =  VWAPIManager.sharedInstance.getCatalogoPruebasParse()
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
        return arrayCatalogoPruebas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VWCatalogoCustomCell

        let catalogoData = arrayCatalogoPruebas[indexPath.row]
        
        cell.myNombreModeloCatalogoPrueba.text = catalogoData.NombreModelo
        cell.myImagenCatalogoPrueba.kf_setImageWithURL(NSURL(string: getImagePath(catalogoData.Imagen!)))
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 242
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleCatalogoVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleCatalogoPruebas") as! VWDetalleCatalogoPruebasViewController
        
        detalleCatalogoVC.arrayCatalogoData = arrayCatalogoPruebas[indexPath.row]
        
        navigationController?.pushViewController(detalleCatalogoVC, animated: true)
    }
    
    
    


}
