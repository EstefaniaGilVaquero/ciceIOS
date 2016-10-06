//
//  WWConcesionarioTableViewController.swift
//  
//
//  Created by CICE on 3/10/16.
//
//

import UIKit
import Kingfisher

class WWConcesionarioTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var refreshTVC = UIRefreshControl()
    var CONSTANTES = Constantes()
    var arrayConcesionarios = [WWConcesionariosModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Alimentamos el array
        arrayConcesionarios = WWApiManager.sharedInstance.getConcesionarioParse()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshTVC.backgroundColor = UIColor(red: 255 / 255, green: 128 / 255, blue: 0 / 255, alpha: 1.0)
        refreshTVC.attributedTitle = NSAttributedString(string: CONSTANTES.TEXTO_RECARGA_TABLA)
        refreshTVC.addTarget(self, action: Selector(refreshFunction(tableView,endRefreshTVC : refreshTVC)), forControlEvents: .ValueChanged)
        tableView.addSubview(refreshTVC)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WWConcesoniarioCustomCell
        
        let concesionariosData = arrayConcesionarios[indexPath.row]
        
        cell.myNombreConcesionario.text = concesionariosData.Nombre
        cell.myDireccionConcesionario.text = concesionariosData.Ubicacion
        cell.myWebConcesionario.text = concesionariosData.Provincia_Nombre
        cell.myTelefonoBTN.setTitle("\(concesionariosData.telefono!)", forState: .Normal)
        cell.myTelefonoBTN.tag = indexPath.row
        
        cell.myTelefonoBTN.addTarget(self, action: #selector(WWConcesionarioTableViewController.muestraTelefono(_:)), forControlEvents: .TouchUpInside)
        
        cell.myImagenConcesionario.kf_setImageWithURL(NSURL(string: getImagePath(concesionariosData.Imagen!)))
        
        return cell
        
    }
    
    func muestraTelefono(sender : UIButton) {
        
        let telefonoData = arrayConcesionarios[sender.tag].telefono
        let url = NSURL(string: "tel://\(telefonoData)")
        UIApplication.sharedApplication().openURL(url!)
    }
   
    func getImagePath(nombreImagen : String) ->String {
        return  CONSTANTES.BASE_FOTO_URL + nombreImagen
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detalleConcesionarioVC = self.storyboard?.instantiateViewControllerWithIdentifier("detalleConcesionarios") as! WWDetalleConcesaionarioViewController
        
        detalleConcesionarioVC.arrayConcesionariosData = arrayConcesionarios[indexPath.row]
        navigationController?.pushViewController(detalleConcesionarioVC, animated: true)
        
    
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
