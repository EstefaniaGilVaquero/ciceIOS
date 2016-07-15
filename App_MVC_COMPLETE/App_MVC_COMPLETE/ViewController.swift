//
//  ViewController.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    private var allAlbumesMusicales = [ICOAlbumModel]()
    private var currentAlbumMusicalData : (titulos: [String], valores : [String])?
    private var indiceAlbumActual = 0
    
    //MARK: - IBOUTLET
    @IBOutlet weak var MyTableViewVC: UITableView!
    @IBOutlet weak var miPropioDesplazadorHorizontal: ICOHorizontalScroller!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        indiceAlbumActual = 0
        
        //2
        allAlbumesMusicales = ICOLibraryAPI.sharedInstance.getAlbumesMusicales()
        
        //3
        MyTableViewVC.delegate = self
        MyTableViewVC.dataSource = self
        
        //4
        showDataForAlbumesMusicales(indiceAlbumActual)
        
        //TODO: - DELEGADO HORIZONTAL
        miPropioDesplazadorHorizontal.icoDelegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    func showDataForAlbumesMusicales (albumesIndice : Int){
        //1. Codigo defensivo, es importante para asegurarnos que el indice solicitado es inferior a la cantidad de albumes
        if albumesIndice < allAlbumesMusicales.count && albumesIndice > -1{
            //2.Traemos el album musical
            let album = allAlbumesMusicales[albumesIndice]
            //3.Almacenamos los datos del album para posteriormente presentarlos en TV
            currentAlbumMusicalData = album.icoe_tableRepresentation()
        }else{
            currentAlbumMusicalData = nil
        }
        MyTableViewVC.reloadData()
    }

}

//MARK: - DELEGADO DE UITABLEVIEW
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let albumData = currentAlbumMusicalData{
            return albumData.titulos.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if let albumData = currentAlbumMusicalData{
            cell.textLabel?.text = albumData.titulos[indexPath.row]
            cell.detailTextLabel?.text = albumData.valores[indexPath.row]
        }
        return cell
    }
    
}

//MARK: - DELEGATE SCROLL HORIZONTAL
extension ViewController : ICOHorizontalScrollerDelegate{
    
    func numeroVistasEnHorizontalScroller(scroller: ICOHorizontalScroller) -> Int {
        return 1
    }
    
    func vistaPorIndiceHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int) -> UIView {
        
        let albumMusical = allAlbumesMusicales[indice]
        let vistaAlbumMusical = ICOAlbumView(frame: CGRectMake(0, 0, 100, 100), caratulaAlbum: albumMusical.urlCaraturla!)
        if indiceAlbumActual == indice{
            vistaAlbumMusical.hightLightAlbum(didHighLightView: true)
        }else{
            vistaAlbumMusical.hightLightAlbum(didHighLightView: false)
        }
        return vistaAlbumMusical
    }
    
    func clickVistaPorIndiceHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int) {
        let vistaAlbumMusicalPrevio = scroller.vistaIndiceObjeto(indiceAlbumActual) as! ICOAlbumView
        vistaAlbumMusicalPrevio.hightLightAlbum(didHighLightView: false)
        indiceAlbumActual = indice
        
        let vistaAlbumMusicalSeleccionada = scroller.vistaIndiceObjeto(indiceAlbumActual) as! ICOAlbumView
        vistaAlbumMusicalSeleccionada.hightLightAlbum(didHighLightView: true)
        showDataForAlbumesMusicales(indice)
    }
    
    func vistaInicial(scroller: ICOHorizontalScroller) -> Int {
        return Int()
    }
}




























