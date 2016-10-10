//
//  WWCatalogoPruebasTableViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//


import UIKit
import Kingfisher

class WWCatalogoPruebasTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var arrayCatalogoPruebas = [WWCatalogoPruebas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshTVC.backgroundColor = UIColor(red: 255 / 255, green: 128 / 255, blue: 0 / 255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView,endRefreshTVC : refreshTVC)), forControlEvents: .ValueChanged)
        tableView.addSubview(refreshTVC)

        arrayCatalogoPruebas = WWApiManager.sharedInstance.getCatalogoPruebasParse()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WWCatalogoCustomCell
        
        let catalogoData = arrayCatalogoPruebas[indexPath.row]
        
        cell.myNombreModelo.text = catalogoData.NombreModelo
        cell.myImagenCatalogoPruebas.kf_setImageWithURL(NSURL(string: getImagePath(catalogoData.Imagen!)))
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 242
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleCatalogoPruebasVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleCatalogoPruebas") as! WWCatalogoPruebasViewController
        
        detalleCatalogoPruebasVC.arrayCatalogoPruebasData = arrayCatalogoPruebas[indexPath.row]
        navigationController?.pushViewController(detalleCatalogoPruebasVC, animated: true)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
