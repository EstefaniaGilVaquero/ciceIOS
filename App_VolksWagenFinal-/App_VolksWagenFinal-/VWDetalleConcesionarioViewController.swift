//
//  VWDetalleConcesionarioViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 3/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VWDetalleConcesionarioViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayConcesionariosData : VWConcesionariosModel?
    let CONSTANTES = Constantes()

    //MARK: - IBOUTLET
    @IBOutlet weak var myImagenConcesionarioDetalle: UIImageView!
    @IBOutlet weak var myNombreConcesionarioDetalle: UILabel!
    @IBOutlet weak var myTelefonoFijoConcesionarioDetalle: UILabel!
    @IBOutlet weak var myProvinciaConcesionarioDetalle: UILabel!
    @IBOutlet weak var myContactoConcesionarioDetalle: UILabel!
    @IBOutlet weak var myEmailConcesionarioDetalle: UILabel!
    @IBOutlet weak var myDireccionConcesionarioDetalle: UILabel!
    @IBOutlet weak var myMapaLocalizacionConcesionarioDetalle: MKMapView!
    @IBOutlet weak var myScrollViewConcesionarioDetalle: UIScrollView!
    
    
    //MARK: - IBACTION
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Setter de las propiedades
        myScrollViewConcesionarioDetalle.contentSize = CGSizeMake(320, 768)
        myNombreConcesionarioDetalle.text = arrayConcesionariosData?.Nombre
        myTelefonoFijoConcesionarioDetalle.text = String(arrayConcesionariosData?.telefono)
        myProvinciaConcesionarioDetalle.text = arrayConcesionariosData?.Provincia_Nombre
        myContactoConcesionarioDetalle.text = arrayConcesionariosData?.Contacto
        myEmailConcesionarioDetalle.text = arrayConcesionariosData?.CoreoContacto
        myDireccionConcesionarioDetalle.text = arrayConcesionariosData?.Ubicacion
        
        //Setter de la Imagen
        let myImagenConcesionario = arrayConcesionariosData?.Imagen
        let myImagenUrl = NSURL(string: getImagePath(myImagenConcesionario!))
        let myImageData = NSData(contentsOfURL: myImagenUrl!)
        myImagenConcesionarioDetalle.image = UIImage(data: myImageData!)
        
        //Setter de Mapa
        let region =  MKCoordinateRegion(center: CLLocationCoordinate2DMake((arrayConcesionariosData?.Latitud!)!, (arrayConcesionariosData?.Longitud!)!), span: MKCoordinateSpanMake(0.01, 0.01))
        myMapaLocalizacionConcesionarioDetalle.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake((arrayConcesionariosData?.Latitud!)!, (arrayConcesionariosData?.Longitud!)!)
        annotation.title = arrayConcesionariosData?.Ubicacion
        annotation.subtitle = arrayConcesionariosData?.Provincia_Nombre
        myMapaLocalizacionConcesionarioDetalle.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImagePath(nombreImagen : String) ->String {
        return CONSTANTES.BASE_FOTO_URL + nombreImagen
    }
    

}
