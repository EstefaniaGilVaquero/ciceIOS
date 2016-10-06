//
//  WWDetalleConcesaionarioViewController.swift
//  
//
//  Created by CICE on 3/10/16.
//
//

import UIKit
import MapKit
import CoreLocation

class WWDetalleConcesaionarioViewController: UIViewController {
    
    var arrayConcesionariosData : WWConcesionariosModel?
    var CONSTANTES = Constantes()
    
    

    @IBOutlet weak var myImagenConcesionarioDetalle: UIImageView!
    @IBOutlet weak var myNombreConcesionarioDetalle: UILabel!
    @IBOutlet weak var myTelefonoFijoConcesionario: UILabel!
    @IBOutlet weak var myProvinciaConcesionarioDetalle: UILabel!
    @IBOutlet weak var myContactoConcesionario: UILabel!
    @IBOutlet weak var myEmailConcesionario: UILabel!
    @IBOutlet weak var mDireccionConcesionario: UILabel!
    @IBOutlet weak var myScrollViewConcesionario: UIScrollView!
    @IBOutlet weak var myMapaLocalizacionConcesionario: MKMapView!

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //propiedades
        myScrollViewConcesionario.contentSize = CGSizeMake(320, 600)
        myNombreConcesionarioDetalle.text = arrayConcesionariosData?.Nombre
        myTelefonoFijoConcesionario.text = String(arrayConcesionariosData?.telefono)
        myProvinciaConcesionarioDetalle.text = arrayConcesionariosData?.Provincia_Nombre
        myContactoConcesionario.text = arrayConcesionariosData?.Contacto
        myEmailConcesionario.text = arrayConcesionariosData?.CoreoContacto
        mDireccionConcesionario.text = arrayConcesionariosData?.Ubicacion
        
        
        //Tratamiento de imagen
        let myImagenConcesionario = arrayConcesionariosData?.Imagen
        let myImageUrl = NSURL(string: getImagePath(myImagenConcesionario!))
        let myImageData = NSData(contentsOfURL: myImageUrl!)
        myImagenConcesionarioDetalle.image = UIImage(data: myImageData!)

        //Tratamiento de Mapa
        let latitudData = arrayConcesionariosData?.Latitud
        let longitudData = arrayConcesionariosData?.Longitud
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitudData!, longitudData!), span: MKCoordinateSpanMake(0.01, 0.01))
        myMapaLocalizacionConcesionario.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(latitudData!, longitudData!)
        annotation.title = arrayConcesionariosData?.Ubicacion
        annotation.subtitle = arrayConcesionariosData?.Provincia_Nombre
        myMapaLocalizacionConcesionario.addAnnotation(annotation)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImagePath(nombreImagen : String) ->String {
        return  CONSTANTES.BASE_FOTO_URL + nombreImagen
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
